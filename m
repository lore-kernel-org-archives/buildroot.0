From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 12:59:36 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: test_glxinfo load X11
 modules in the right order
In-Reply-To: <f88891fa-a83d-9e1a-54de-5b1effeb2de8@gmail.com> (Romain Naour's
 message of "Thu, 20 May 2021 12:15:25 +0200")
References: <20210513141149.3154510-1-romain.naour@gmail.com>
 <20210513141149.3154510-2-romain.naour@gmail.com>
 <87lf89ahm3.fsf@dell.be.48ers.dk>
 <f88891fa-a83d-9e1a-54de-5b1effeb2de8@gmail.com>
Message-ID: <87zgwp8ycn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> > Fixes:
 >> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899
 >> 
 >> > [1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
 >> 
 >> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> 
 >> Is this also applicable to 2021.02.x, E.G. where we use the older swrast
 >> driver?

 > This patch is needed after the switch to the gallium swrast.
 > Since the test_glxinfo was working for the 2021.02 release the backport is not
 > needed.

Ok, thanks!

-- 
Bye, Peter Korsgaard
