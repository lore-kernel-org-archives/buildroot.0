From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 23 Jan 2013 09:26:36 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <CAHXCMMKWLuEPvv0XC_WHxE+xu0QuJZQgY1Rq3RTX3=Ki5jWxfA@mail.gmail.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
 <CAHXCMMKWLuEPvv0XC_WHxE+xu0QuJZQgY1Rq3RTX3=Ki5jWxfA@mail.gmail.com>
Message-ID: <50FF9EBC.1030404@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/01/2013 17:36, Samuel Martin wrote:
> Hi Maxime, all,
> 
> 2013/1/19 Samuel Martin <s.martin49@gmail.com>:
> [...]
>>
>> BTW, here is a build log: http://code.bulix.org/8rjnsp-82865, in which
>> the _decimal module fails to be built.
>>
>> See near the end of the log, it seems the build script of python3 for
>> the target does some mix up between the host and the target build
>> config of the package :-/
> 
> After some investigation, here is a patch fixing the build of the
> _decimal module:
> http://code.bulix.org/p4cp5i-82866
> 
> However, source for host-python3 are still used...

Maybe this can come as a separate patch, since it's not really related
to this bug that was reported?

Thanks,
Maxime


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
