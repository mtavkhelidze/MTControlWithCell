#ifndef _MT_COMMON_H
#define _MT_COMMON_H
#ifdef DEBUG
#define enter() (NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)))
#else
#define enter()
#endif // DEBUG
#endif // _MT_COMMON_H