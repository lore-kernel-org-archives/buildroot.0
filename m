From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 22:42:23 +0200
Subject: [Buildroot] [PATCH v2] package/avahi: does not build with
	static-only
In-Reply-To: <1400271779-15102-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 16 May 2014 22:22:59 +0200")
References: <1400271779-15102-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87egztpia8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ... and propagate to reverse dependencies.

 > Fixes (which I reproduced here):
 >     http://autobuild.buildroot.net/results/ea2/ea2c8f20c4032bf82876805ea787a55834091cec

 > Should fix (which I did not even try to reproduce):
 >     http://autobuild.buildroot.net/results/4ef/4ef5bfc17f50bddb00f7ef3d62fc1fe963b7da82
 >     http://autobuild.buildroot.net/results/76e/76e4854812b0ef3862c080eead4012b35ef27f0f
 >     http://autobuild.buildroot.net/results/5bf/5bfb3fd9fe61bef5f998dc5999ce2060c334662c
 >     http://autobuild.buildroot.net/results/dc6/dc607c35471ef6dda04e06ad05ae7794615af578

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

 > ---
 > Changes v1 -> v2:
 >   - add autobuilder references  (Thomas)
 >   - propagate to reverse dependencies  (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
