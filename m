From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 8 Aug 2013 19:22:00 -0300
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
Message-ID: <CAExDhvY3_+rd73DwkkvX0C3FfY-hg6cd_xW57Wh7fEGnWujqWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Aug 8, 2013 at 5:24 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
>> So you are saying that if I upgrade my host gcc (the native one) to
>> 4.6, that the cross AVR32 gcc will build successfully, and not suffer
>
> By the way, my host gcc is:
> gcc (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2

I was using AVR32 and we still have boards with it in the field. I can
second that using a newer host gcc will not build avr32 toolchain.
Even though I haven't built for AVR32 in a long time, I remember that
I had to keep an old gcc on my Gentoo linux just for the AVR32
toolchain to build. On Gentoo it's a matter of gcc-config switching if
it's installed.

Kind Regards,
     Thiago A. Correa
