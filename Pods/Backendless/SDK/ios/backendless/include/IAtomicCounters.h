//
//  IAtomicCounters.h
//  backendlessAPI
/*
 * *********************************************************************************************************************
 *
 *  BACKENDLESS.COM CONFIDENTIAL
 *
 *  ********************************************************************************************************************
 *
 *  Copyright 2014 BACKENDLESS.COM. All Rights Reserved.
 *
 *  NOTICE: All information contained herein is, and remains the property of Backendless.com and its suppliers,
 *  if any. The intellectual and technical concepts contained herein are proprietary to Backendless.com and its
 *  suppliers and may be covered by U.S. and Foreign Patents, patents in process, and are protected by trade secret
 *  or copyright law. Dissemination of this information or reproduction of this material is strictly forbidden
 *  unless prior written permission is obtained from Backendless.com.
 *
 *  ********************************************************************************************************************
 */

#import <Foundation/Foundation.h>

@protocol IResponder;
@class Fault;

@protocol IAtomic <NSObject>

// sync methods with fault return (as exception)
-(NSNumber *)get;
-(NSNumber *)getAndIncrement;
-(NSNumber *)incrementAndGet;
-(NSNumber *)getAndDecrement;
-(NSNumber *)decrementAndGet;
-(NSNumber *)addAndGet:(long)value;
-(NSNumber *)getAndAdd:(long)value;
-(NSNumber *)compareAndSet:(long)expected updated:(long)updated;
-(id)reset;

// async methods with block-based callback
-(void)get:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)getAndIncrement:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)incrementAndGet:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)getAndDecrement:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)decrementAndGet:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)addAndGet:(long)value response:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)getAndAdd:(long)value response:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)compareAndSet:(long)expected updated:(long)updated response:(void (^)(NSNumber *))responseBlock error:(void (^)(Fault *))errorBlock;
-(void)reset:(void (^)(id))responseBlock error:(void (^)(Fault *))errorBlock;

@end
