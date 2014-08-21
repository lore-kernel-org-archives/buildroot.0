From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:23:40 +0200
Subject: [Buildroot] [PATCH 1/2] ntp: fix undefined variable in error
 print
In-Reply-To: <1408497647-2258-1-git-send-email-danomimanchego123@gmail.com>
References: <1408497647-2258-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140821152340.1721b80a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Tue, 19 Aug 2014 21:20:46 -0400, Danomi Manchego wrote:
> The variable "$SCRIPTNAME" is undefined; replace with "$0".
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/ntp/S49ntp |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch, and the similar patch for tvheadend, applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
