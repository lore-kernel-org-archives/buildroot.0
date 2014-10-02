From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Oct 2014 20:59:21 +0200
Subject: [Buildroot] [PATCH 2/2] opencv: Let opencv's build system
	handle the ts module dependencies
In-Reply-To: <CAHXCMML4wgCRFUkYnuhBAEc833FLo4wK4FUg9j7AsA=JpDT8Ag@mail.gmail.com>
 (Samuel Martin's message of "Wed, 1 Oct 2014 22:05:48 +0200")
References: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
 <CAHXCMML4wgCRFUkYnuhBAEc833FLo4wK4FUg9j7AsA=JpDT8Ag@mail.gmail.com>
Message-ID: <87sij6l2ly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 > Thought I understand that you want to keep this knob similar to the
 > others, it is in contradiction with some pending patch [1] which fix
 > the inter OpenCV modules dependencies.

 > Whatever this patch got merged or not, the patch [1] will need to be
 > updated after the bump to OpenCV-2.4.10 is merged.
 > So, I have no strong opinion about this patch:
 > - applying it won't break the autobuilders;
 > - whereas not applying it only does not improve that much the
 > situation wrt the issue that [1] attemps to fix.

I've applied these two. Samuel, care to rebase and resend your patch?

-- 
Bye, Peter Korsgaard
