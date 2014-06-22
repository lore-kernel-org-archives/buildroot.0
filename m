From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:28:43 +0200
Subject: [Buildroot] [PATCH 1/1 v2] rpcbind : add startup script
In-Reply-To: <1402839157-10710-1-git-send-email-sagaert.johan@skynet.be>
References: <1402839157-10710-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140622222843.7dadc9bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 15 Jun 2014 15:32:37 +0200, Sagaert Johan wrote:
> rpcbind must be started at boot time.
> Without this any nfs mount will fail.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
> v2: reworked using INSTALL_INIT_SYSV hook
> 
>  package/rpcbind/rpcbind.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Where is the startup script itself?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
