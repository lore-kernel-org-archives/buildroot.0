From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 9 Aug 2013 07:51:04 +0300
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LWVRynN+wymOO3i=ZZ=tdgAfKyEsNrxPiYju_WSN6m5fw@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
 <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
 <20130807172033.564940d1@skate>
 <CAAXf6LVT144yhgAh5ce5O9FjR=osQ=qV=sod=-pDSOiqeRTvuA@mail.gmail.com>
 <CAAXf6LVFECrtPWQsw0HU5H+ZHjU0tYmz5SNgeKsBA_0RzkNJsQ@mail.gmail.com>
 <20130808000726.66ab7194@skate>
 <CAAXf6LUvZEOeF8dDrESqYKr3iiT3haQFzrH-=VnH7gDcvd+z-g@mail.gmail.com>
 <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
 <CAAXf6LVdx1h2qm8767UCavTqTR1q-L8Z0Kv93zqCfE8OqyYd5w@mail.gmail.com>
 <CAHt8ZCO+G8E3EggLj8KFRHhvxiPzCFT_LwZQyniEed3Q2BfL-Q@mail.gmail.com>
 <CAAXf6LWJTQCWH-rEppNNVy_j2SJacecaWGwXxgiW-q7JboO3=Q@mail.gmail.com>
 <CAHt8ZCP6LiPDV+utoknppQ-O1gYtTSgSCYrpokXDUW67+W8-Ow@mail.gmail.com>
 <CAAXf6LUqGG9O2eWfokH8VAuxa-2xDw=yKw-1vq_9VBpzotCjKA@mail.gmail.com>
 <CAAXf6LWVRynN+wymOO3i=ZZ=tdgAfKyEsNrxPiYju_WSN6m5fw@mail.gmail.com>
Message-ID: <CAAHaz6FPnCjg7n-VWxFpHsBRx-Z35U-GWTK0nkZuGK+wBO_H0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

2013/8/8 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

> >> That probably explains why your builds fail...
> > So you are saying that if I upgrade my host gcc (the native one) to
> > 4.6, that the cross AVR32 gcc will build successfully, and not suffer
> > from the relocation truncation messages?
>
> By the way, my host gcc is:
> $ gcc --version
> gcc (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2
>

My gcc is:

$ gcc --version
gcc (GCC) 4.5.1 20100924 (Red Hat 4.5.1-4)
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130809/c955b328/attachment-0001.html>
