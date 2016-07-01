From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 17:16:51 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: improve help text
 and prompt
In-Reply-To: <1467386079-26051-1-git-send-email-yann.morin.1998@free.fr>
References: <1467386079-26051-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160701171651.56e2a85b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 17:14:39 +0200, Yann E. MORIN wrote:
> The way the help text and prompt for the kernel header version choice is
> written can be misleading to some users.
> 
> Rewite them so it is more explicit.
> 
> Reported-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/linux-headers/Config.in.host | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
