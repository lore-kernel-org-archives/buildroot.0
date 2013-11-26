From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Nov 2013 12:36:27 +0100
Subject: [Buildroot] [PATCH] sunxi-mali,
	ti-gfx: add missing dollar sign in egl.pc
In-Reply-To: <1385457235-30264-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Tue, 26 Nov 2013 11:13:55 +0200")
References: <1385457235-30264-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <874n6zl7ic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>

Good catch! Committed, thanks.

Probably that explains:

http://autobuild.buildroot.net/results/592/592acfc6508f01ab82b5692ad52e0fe6d16a3ea3/build-end.log

Notice that this isn't really a sane config, as it has two opengl
providers enabled (rpi + sunxi). It would be good if we could homehow
disallow that, but I think we end up with circular dependencies.

-- 
Bye, Peter Korsgaard
