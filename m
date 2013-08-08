From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Aug 2013 22:09:43 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAHt8ZCP6LiPDV+utoknppQ-O1gYtTSgSCYrpokXDUW67+W8-Ow@mail.gmail.com>
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
Message-ID: <CAAXf6LUqGG9O2eWfokH8VAuxa-2xDw=yKw-1vq_9VBpzotCjKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Thu, Aug 8, 2013 at 9:42 PM, Simon Dawson <spdawson@gmail.com> wrote:
> Hi Thomas,
>
> On 8 August 2013 18:34, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> That's interesting. I've tried building the atngw100_defconfig on
>> 2013.05, 2013.02, and 2012.02, and none of them build successfully if
>> I enable C++ support (nothing else changed).
>> Could you send your config file for the working C++ build, then I can
>> try here. Either there is some build system difference, or (more
>> likely) there is a combination of config options that doesn't work.
>
> Oops. I had provided some misinformation, I'm afraid. I'm actually
> using gcc 4.6 to build the toolchain --- I had forgotten that I'd
> exported HOSTCC and HOSTCXX for the build.
>
> That probably explains why your builds fail...
>

So you are saying that if I upgrade my host gcc (the native one) to
4.6, that the cross AVR32 gcc will build successfully, and not suffer
from the relocation truncation messages?
Can you explain how this can happen, do you have more details?

Thanks,
Thomas
