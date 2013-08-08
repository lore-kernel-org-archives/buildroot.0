From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Aug 2013 19:57:33 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LWJTQCWH-rEppNNVy_j2SJacecaWGwXxgiW-q7JboO3=Q@mail.gmail.com>
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
Message-ID: <20130808195733.3ac7fd2a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 8 Aug 2013 19:34:55 +0200, Thomas De Schampheleire wrote:

> That's interesting. I've tried building the atngw100_defconfig on
> 2013.05, 2013.02, and 2012.02, and none of them build successfully if
> I enable C++ support (nothing else changed).
> Could you send your config file for the working C++ build, then I can
> try here. Either there is some build system difference, or (more
> likely) there is a combination of config options that doesn't work.

Do you have locale support enabled?

I'm pretty sure there was a combination like avr32 + C++ + locale that
never worked, and we even had a set of "depends on" to ensure such a
combination could never be enabled.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
