From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sat, 04 Sep 2010 22:36:03 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable,
 including scsi patch for latests kernel headers
In-Reply-To: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
References: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <4C82ADB3.2060704@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 04.09.2010 20:49, schrieb Marcus Osdoba:
> bump to latest (begin of September 2010) kernel headers,
> scsi.h and scsi_net.h have not changed since April 2010
> ->  so renaming the scsi patches files in toolchain/kernel-headers/ to match higher versions
>
> Signed-off-by: Marcus Osdoba<marcus.osdoba@googlemail.com>
> ---
I have tested building toolchains with recent headers 2.6.32, 2.6.34 and 
2.6.35.
