From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 20:14:54 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-good: cleanup of configure
 options
In-Reply-To: <1465551278-19411-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1465551278-19411-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20160610201454.29cbad78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 11:34:38 +0200, Marcin Nowakowski wrote:
> taglib support has been added in 8299f30a, but the '--disable-taglib'
> option has not been removed from conf opts at the top of the .mk file
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
