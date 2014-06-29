From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 18:20:25 +0200
Subject: [Buildroot] [PATCH 1/1] prevent selecting portmap when rpcbind
 is selected.
In-Reply-To: <1402837516-6202-1-git-send-email-sagaert.johan@skynet.be>
References: <1402837516-6202-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140629182025.51049c87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 15 Jun 2014 15:05:16 +0200, Sagaert Johan wrote:
> portmap and rpcbind must not be selected at the same time.
> Users should use rpcbind in favor of the deprecated portmap. 
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  package/portmap/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied, after tweaking the commit title, and adding a comment
above the dependency to explain why it's there.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
