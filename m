From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:46:56 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: disable ldconfig through
 configure option
In-Reply-To: <1446589470-10304-1-git-send-email-gabe@hashrabbit.co>
References: <1446589470-10304-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <20151103234656.2d94f665@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabe Evans,

On Tue,  3 Nov 2015 22:24:30 +0000, Gabe Evans wrote:
> Systemd v216+ includes a configure option to disable ldconfig.
> 
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> ---
>  package/systemd/systemd.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
