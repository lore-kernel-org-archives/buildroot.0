From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 13:20:12 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-input-evdev: enable compile
	without udev dependency.
In-Reply-To: <trinity-81c35678-ff25-4e16-86ef-0899681ee5af-1381517661336@3capp-gmx-bs41>
 (Peter Seiderer's message of "Fri, 11 Oct 2013 20:54:21 +0200 (CEST)")
References: <1381435927-7090-1-git-send-email-ps.report@gmx.net>
 <20131010230130.052a22a4@skate>
 <trinity-81c35678-ff25-4e16-86ef-0899681ee5af-1381517661336@3capp-gmx-bs41>
Message-ID: <87d2n8rteb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 >> Thanks. Have you submitted this patch upstream? This is more-and-less a
 >> feature patch, and in Buildroot, we don't like too much carrying
 >> feature patches if we don't believe they will be merged upstream.
 >> 

 Peter> Yes, patch already proposed upstream, see https://bugs.freedesktop.org/show_bug.cgi?id=70356

 >> Of course, if it has been submitted upstream and received what seems
 >> like a positive feedback, it's perfectly fine to take it in Buildroot
 >> until upstream makes a new release.

 Peter> Let's wait awhile for upstream comments...

In the mean time Peter (there's too many Peters in this discussion)
Hutterer has closed it as WONTFIX, so I'm afraid I'll have to disappoint
and say no..

-- 
Bye, Peter Korsgaard
