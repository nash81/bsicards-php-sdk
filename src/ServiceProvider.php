<?php

namespace BSICards;

use Illuminate\Support\ServiceProvider as LaravelServiceProvider;

/**
 * Laravel Service Provider for BSICARDS SDK
 */
class ServiceProvider extends LaravelServiceProvider
{
    /**
     * Register services
     */
    public function register(): void
    {
        $this->app->singleton(BSICardsClient::class, function ($app) {
            $publicKey = config('bsicards.public_key') ?? env('BSICARDS_PUBLIC_KEY');
            $secretKey = config('bsicards.secret_key') ?? env('BSICARDS_SECRET_KEY');

            return new BSICardsClient($publicKey, $secretKey);
        });
    }

    /**
     * Boot services
     */
    public function boot(): void
    {
        $this->publishes([
            __DIR__ . '/../config/bsicards.php' => config_path('bsicards.php'),
        ], 'bsicards-config');
    }
}

