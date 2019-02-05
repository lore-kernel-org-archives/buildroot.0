From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 10:05:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/android-tools: Fix build with
 OpenSSL 1.1.x
In-Reply-To: <20190204233029.1318-1-vadim4j@gmail.com> (Vadim Kochan's message
 of "Tue, 5 Feb 2019 01:30:29 +0200")
References: <20190204233029.1318-1-vadim4j@gmail.com>
Message-ID: <871s4mr4f4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > Use patch from:
 > 	https://github.com/lede-project/source/commit/f63f20fb93c7e67775cb01d97fc88b5b29452b81

 > which fixes compilation of adb with OpenSSL 1.1.x, and took only part
 > for adb only.

 > Fixes:

 > 	http://autobuild.buildroot.net/results/66f/66f05eb9a56aa8526a1420334d68c7eda094e90e/

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

I did a quick build both with libressl and and openssl without
issues. Longer term we might want to bump the version. Debian have
patches for 1.1.1x support as well:

https://sources.debian.org/patches/android-tools/5.1.1.r38-1.1/

-- 
Bye, Peter Korsgaard
