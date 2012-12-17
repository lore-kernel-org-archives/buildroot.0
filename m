From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 07:26:21 +0100
Subject: [Buildroot] [PATCH] package/libseccomp: works only on x86
In-Reply-To: <1355698594-25590-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 16 Dec 2012 23:56:34 +0100")
References: <1355698594-25590-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r4mp9otu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> As it is, the libseccomp code explicitly checks for x86 (32- or 64-bit),
 Yann> so it can't work on other architectures.

Committed, thanks.

It seems we'll need the same for spice:

http://autobuild.buildroot.net/results/36fbda99bcddbce8b66c87ae5ee8d4f9105bd296/build-end.log

-- 
Bye, Peter Korsgaard
