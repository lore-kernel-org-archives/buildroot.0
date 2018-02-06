From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 16:49:10 +0100
Subject: [Buildroot] [PATCH v2] open-lldp: add patch to remove pid_t
 error
In-Reply-To: <20180122120903.22839-1-laurent_pubs@yahoo.com>
References: <20180122120903.22839-1-laurent_pubs@yahoo.com>
Message-ID: <20180206164910.37620947@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Jan 2018 13:09:03 +0100, Laurent Charpentier wrote:
> Added #include <sys/types.h> to fix unknown type 'pid_t' errors.
> 
> This is to fix autobuild failures:
> http://autobuild.buildroot.net/results/f7e94ae1c2aa6b3f6567d1f567a66329974834e9
> http://autobuild.buildroot.net/results/8a43938d9c0391a846757a54cf5f956b64470865
> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> ---
>  .../open-lldp/0004-fixed-unknown-type-pid_t.patch  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/open-lldp/0004-fixed-unknown-type-pid_t.patch

Applied to master, thanks. Could you submit this patch upstream if not
already done?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
