From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 22:56:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: Compare host/target Linux
 version only during build phase
In-Reply-To: <1432198043-20364-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432198043-20364-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150521225650.12e8f177@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 21 May 2015 10:47:23 +0200, Bernd Kuhls wrote:
> This patch fixes an error during source-check.
> 
> Thanks to Thomas for the hint:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/116183
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/qemu/qemu.mk |    2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
