From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 May 2010 12:11:29 +0200
Subject: [Buildroot] [PATCH 0/6] [WIP] Add crostool-NG as backend to
 generate toolchain
In-Reply-To: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
References: <20100509230759.16258.48956.stgit@roazhon.bzh.lan>
Message-ID: <20100514121129.01085a6a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

I did a quick review of your patches, and found nothing specific to
say, it looks good to me.

I would at least like patches 1 -> 5 to be merged early in the release
cycle of 2010.08, because I have other changes to make on external
toolchain support that will depend on these. So don't wait for the
CT-NG support to be fully ready to send preliminary patches cleaning up
things that you need for CT-NG integration.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
