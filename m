From: Yury Luneff <bitterman@ya.ru>
Date: Thu, 25 Mar 2010 20:16:16 +0300
Subject: [Buildroot] external toolchain and sysroot
In-Reply-To: <93399903.20100325201240@ya.ru>
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru>
Message-ID: <44830928.20100325201616@ya.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i've fixed uemacs makefile.

And the other problem was not with openvpn but with vsftpd which .mk did 
not include "${TARGET_LDFLAGS}" at all.

It seem to be a common problem in buildroot for now.
