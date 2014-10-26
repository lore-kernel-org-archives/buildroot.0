From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:10:14 +0100
Subject: [Buildroot] [PATCH v2 1/1] mp4v2: new package
In-Reply-To: <1413793019-17632-1-git-send-email-jkrause@posteo.de>
References: <1413793019-17632-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141026141014.2164cbb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 20 Oct 2014 10:16:59 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
> Changes v1 -> v2:
>   - fix indentation (tab width is 8)
>   - remove unnecessary config option --disable-debug (pkg-autotools 
>     infrastructure will handle this soon)
>   - use positive logic for BR2_PACKAGE_MP4V2_UTIL

Thanks, applied. I've added the use of
--enable-largefile/--disable-largefile depending on the value of
BR2_LARGEFILE.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
