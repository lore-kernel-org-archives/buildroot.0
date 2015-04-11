From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:32:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/flac: Fix musl compile
In-Reply-To: <1428740243-22440-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428740243-22440-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411153227.4e3bd949@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 10:17:23 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/flac/0002-sigemptyset.patch |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/flac/0002-sigemptyset.patch

Applied, thanks. Could you please submit the patch upstream? It isn't
fixed in upstream currently:
https://git.xiph.org/?p=flac.git;a=blob;f=src/libFLAC/cpu.c.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
