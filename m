From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 17:53:23 +0200
Subject: [Buildroot] [PATCH v14 1/1] squeezelite: new package
In-Reply-To: <201509291108.t8TB8DpA019446@ms-omx02.plus.so-net.ne.jp>
References: <201509291108.t8TB8DpA019446@ms-omx02.plus.so-net.ne.jp>
Message-ID: <20151012175323.16446133@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Sep 2015 20:08:13 +0900, kei-k at ca2.so-net.ne.jp wrote:
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> Changelog
> v13 -> v14
> - change to use patch file insted of using sed to generate Makefile.
> - change BR2_PACKAGE_SQUEEZELITE_FF -> BR2_PACKAGE_SQUEEZELITE_FFMPEG.
> - improve prompt message for configuration options.
> - change installation destination path to fullpath.
> - remove useless help string.

I have applied your patch, after making a few additional changes:

    [Thomas:
      - replicate the ffmpeg "depends on" related to the broken NIOS2
        toolchains to the BR2_PACKAGE_SQUEEZELITE_FFMPEG option.
      - use the github helper function.
      - add hash file.]

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
