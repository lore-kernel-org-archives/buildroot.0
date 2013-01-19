From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 19 Jan 2013 17:36:47 +0100
Subject: [Buildroot] [PATCH 2/3] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
 <1358517974-30956-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMLxr2ttXFzRfJECxRdJitBbAjM4mXyt2SpzTJV5RMQLwA@mail.gmail.com>
Message-ID: <CAHXCMMKWLuEPvv0XC_WHxE+xu0QuJZQgY1Rq3RTX3=Ki5jWxfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

2013/1/19 Samuel Martin <s.martin49@gmail.com>:
[...]
>
> BTW, here is a build log: http://code.bulix.org/8rjnsp-82865, in which
> the _decimal module fails to be built.
>
> See near the end of the log, it seems the build script of python3 for
> the target does some mix up between the host and the target build
> config of the package :-/

After some investigation, here is a patch fixing the build of the
_decimal module:
http://code.bulix.org/p4cp5i-82866

However, source for host-python3 are still used...

Regards,


-- 
Samuel
