<?php

namespace App\Http\Library;

use Illuminate\Http\JsonResponse;

trait ApiHelpers
{


protected function onSuccess($data,  $message = '',  $code = 200): JsonResponse
{
        return response()->json([
            'status' => $code,
            'message' => $message,
            'data' => $data,
            ], $code);
}

protected function onError( $code,  $message = ''): JsonResponse
{
    return response()->json([
            'status' => $code,
            'message' => $message,
        ], $code);
}


}
