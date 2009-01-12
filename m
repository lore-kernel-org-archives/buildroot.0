From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Mon, 12 Jan 2009 16:34:13 +0100
Subject: [Buildroot] Some issues I have found in buildroot today.
In-Reply-To: <20090112152242.565A7766E4@busybox.osuosl.org>
References: <20090112152242.565A7766E4@busybox.osuosl.org>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1A85066FB6@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have found that libcurl is not properly dependent on host-sed so if I build this package alone it does not work.

I have also found that autoconf can not be built with multi jobs (i.e -j X).

I have also found that for external toolchains you cannot set that you have LOCALE/WCHAR support this limits options somewhat and means libiconv is always built and I would rather not do this.  Can anyone explain the LOCALE support options and what it means for an external toolchain instead of a uclibc built toolchain.

Hope people can help
Daniel Laird
