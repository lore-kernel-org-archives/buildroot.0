From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Aug 2013 19:34:55 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAHt8ZCO+G8E3EggLj8KFRHhvxiPzCFT_LwZQyniEed3Q2BfL-Q@mail.gmail.com>
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
Message-ID: <CAAXf6LWJTQCWH-rEppNNVy_j2SJacecaWGwXxgiW-q7JboO3=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Thu, Aug 8, 2013 at 6:09 PM, Simon Dawson <spdawson@gmail.com> wrote:
> Hi Thomas
>
> On 8 August 2013 09:12, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> So you are able to build a toolchain with C++ support for avr32, using
>> (a custom) buildroot? Is this a public buildroot fork that we can look
>> at? If not: do you know (or could you look up) which changes have been
>> made to make C++ support work?
>
> All I've done is to branch off of the Buildroot master just prior to
> commit 8abb5b33c1aae035cf48b1c81104b433ff884c64, which removed support
> for uClibc 0.9.31. I've then been cherry-picking commits from master,
> as required for my particular project.
>
> I haven't made this fork publicly available. I also haven't had to
> make any changes to get C++ support working --- it already worked for
> me. I'm using host gcc 4.7.3; and the Buildroot-generated toolchain
> builds host-binutils-2.18-avr32-1.0.1

That's interesting. I've tried building the atngw100_defconfig on
2013.05, 2013.02, and 2012.02, and none of them build successfully if
I enable C++ support (nothing else changed).
Could you send your config file for the working C++ build, then I can
try here. Either there is some build system difference, or (more
likely) there is a combination of config options that doesn't work.

Thanks,
Thomas
