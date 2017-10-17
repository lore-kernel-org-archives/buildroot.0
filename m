From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:04:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: fix openssl detection for
	static builds
In-Reply-To: <20171003173044.1595-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 3 Oct 2017 19:30:44 +0200")
References: <20171003173044.1595-1-bernd.kuhls@t-online.de>
Message-ID: <87zi8qjgcf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/8e6/8e639ab8912e7d884fd8e6dbb1ca8b49451dd766/

 > /home/test/autobuild/run/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o):
 > In function `zlib_stateful_expand_block':
 > c_zlib.c:(.text+0x54): undefined reference to `inflate'
 > /home/test/autobuild/run/instance-1/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o):
 > In function `zlib_stateful_compress_block':
 > c_zlib.c:(.text+0xd4): undefined reference to `deflate'

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
