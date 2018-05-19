From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:37:04 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/iucode-tool: Add systemd
 service config
In-Reply-To: <20180515101802.6040-1-david.degrave@mind.be>
References: <20180515101802.6040-1-david.degrave@mind.be>
Message-ID: <20180519213704.0c6f3bbc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 12:18:02 +0200, David De Grave (Essensium/Mind)
wrote:
> From: Alex Suykov <alex.suykov@gmail.com>
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> ---
> Changes v1 -> v2
> 	- Add 'RemainAfterExist=yes' to the unit file.
> 	- Change the link target to relative.
> Changes v2 -> v3
> 	- Fixed copy/paste error in the link target.
> ---
>  package/iucode-tool/iucode-tool.mk |  8 ++++++++
>  package/iucode-tool/iucode.service | 10 ++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/iucode-tool/iucode.service

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
