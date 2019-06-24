From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 05:48:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: bump version
In-Reply-To: <20190622183857.31568-1-bernd.kuhls@t-online.de>
References: <20190622183857.31568-1-bernd.kuhls@t-online.de>
Message-ID: <20190624054801.15b09cfb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jun 2019 20:38:57 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added tarball and license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rtmpdump/rtmpdump.hash | 3 +++
>  package/rtmpdump/rtmpdump.mk   | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/rtmpdump/rtmpdump.hash

This bump is causing a number of build failures. Could you have a look ?

  http://autobuild.buildroot.net/?reason=rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
