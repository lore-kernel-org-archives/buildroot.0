From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:25:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/jack2: backport two build fixes
In-Reply-To: <20170806125840.5694-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 6 Aug 2017 14:58:40 +0200")
References: <20170806125840.5694-1-bernd.kuhls@t-online.de>
Message-ID: <877excltwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > 0005-gcc7.patch fixes
 > http://autobuild.buildroot.net/results/c06/c0610325d7785dfa51c5d36775623ca8fa517f24/

 > 0006-fix-ftbfs-with-clang.patch
 > fixes the subsequent build error:
 > common/memops.c.31.o: In function `sample_move_dither_rect_d16_sSs':
 > memops.c:(.text+0x4dc): undefined reference to `fast_rand'

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
