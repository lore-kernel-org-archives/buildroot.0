From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Feb 2011 08:29:30 +0100
Subject: [Buildroot] [PATCH 1/2] Update to the latest GStreamer packages
In-Reply-To: <AANLkTikNbw8Y9MG8KGgRR6Ztj+9Li1+x4GtNujEjW+Bt@mail.gmail.com>
	(Felipe Contreras's message of "Sat, 5 Feb 2011 00:56:22 +0200")
References: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
	<1296843913-22321-2-git-send-email-felipe.contreras@gmail.com>
	<8739o3qxmg.fsf@macbook.be.48ers.dk>
	<AANLkTikNbw8Y9MG8KGgRR6Ztj+9Li1+x4GtNujEjW+Bt@mail.gmail.com>
Message-ID: <87tygjos6d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

Hi,

 >> Committed, thanks. You forgot to remove the select
 >> BR2_PACKAGE_LIBOIL, but I did that.

 Felipe> It's supposed to be useful outside GStreamer, but I guess nobody
 Felipe> really uses that.

I didn't meant that you should remove the liboil package, just that the
select|depends on statements of the gstreamer packages should be in sync
with the _DEPENDENCIES lines of their makefiles.

 >> Just to be sure - With these version bumps the fixes for make 3.82 are
 >> no longer needed, right?

 Felipe> That's right, they are not needed any more.

Great, thanks.

-- 
Bye, Peter Korsgaard
