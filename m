From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 21:26:26 +0100
Subject: [Buildroot] [PATCH v2] package/gauche: fix 'dlfcn.h: No such
	file' on autobuild
In-Reply-To: <201511171550.tAHFoAcS030490@ms-omx01.plus.so-net.ne.jp> (Hiroshi
 Kawashima's message of "Wed, 18 Nov 2015 00:50:10 +0900")
References: <201511171550.tAHFoAcS030490@ms-omx01.plus.so-net.ne.jp>
Message-ID: <87twokcqz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hiroshi" == Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp> writes:

 > Ported from bdwgc package.
 > When build with BR2_STATIC_LIBS environment, prevent to use dlopen().

 > Fix:
 > http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1

 > Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
 > ---
 > Changes:
 > v1 -> v2
 > - refelect comment from Thomas for refine.

Committed, thanks.

-- 
Bye, Peter Korsgaard
