From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 23:29:52 +0100
Subject: [Buildroot] [PATCH v2] package/gauche: fix 'dlfcn.h: No such
	file' on autobuild
In-Reply-To: <20151117214010.64de14ab@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 17 Nov 2015 21:40:10 +0100")
References: <201511171550.tAHFoAcS030490@ms-omx01.plus.so-net.ne.jp>
 <20151117214010.64de14ab@free-electrons.com>
Message-ID: <871tbocl9b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Hiroshi Kawashima,
 > On Wed, 18 Nov 2015 00:50:10 +0900, Hiroshi Kawashima wrote:
 >> Ported from bdwgc package.
 >> When build with BR2_STATIC_LIBS environment, prevent to use dlopen().
 >> 
 >> Fix:
 >> http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1
 >> 
 >> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

 > This patch is not sufficient. It still fails to build, later, because
 > gauche tries to build a shared library. So I believe gauche really
 > needs to depend on !BR2_STATIC_LIBS. Here is the failure you get:

Ok, I'll drop it then.

-- 
Venlig hilsen,
Peter Korsgaard 
