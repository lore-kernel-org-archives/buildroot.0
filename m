From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Aug 2013 10:12:33 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAHt8ZCOx1o1GPcgFZN9RYQWvGivTy5R6bWuUwX4B67qban++EA@mail.gmail.com>
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
Message-ID: <CAAXf6LVdx1h2qm8767UCavTqTR1q-L8Z0Kv93zqCfE8OqyYd5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

Thanks for your input.

On Thu, Aug 8, 2013 at 9:21 AM, Simon Dawson <spdawson@gmail.com> wrote:
> Hi Thomas,
>
> On 8 August 2013 06:55, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> Current buildroot cannot properly build an AVR32 toolchain with C++
>> support. This problem seems to be present for a while now. Are any of
>> you interested in such C++ support, and do you have time to look into
>> this?
>
> I do currently still require C++ support on avr32. However, since
> support for uClibc 0.9.31.x was removed from Buildroot, I have had to
> build my avr32 toolchain using a custom Buildroot fork: unfortunately,
> while uClibc 0.9.33.x does build for avr32, the result is a root
> filesystem with unusably-slow runtime performance.

So you are able to build a toolchain with C++ support for avr32, using
(a custom) buildroot? Is this a public buildroot fork that we can look
at? If not: do you know (or could you look up) which changes have been
made to make C++ support work?

Best regards,
Thomas
