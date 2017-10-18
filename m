From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:31:36 +0200
Subject: [Buildroot] [V2 3/3] prosody: remove tweaked configuration
In-Reply-To: <20171018164650.514-3-francois.perrad@gadz.org>
References: <20171018164650.514-1-francois.perrad@gadz.org>
 <20171018164650.514-3-francois.perrad@gadz.org>
Message-ID: <20171018223136.49cbc0de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 18:46:50 +0200, Francois Perrad wrote:
> Upgrading a tweaked configuration is painful,
> so stay with the upstream configuration which is already installed.
> 
> Everybody could make its own configuration in its rootfs_overlay.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/prosody.cfg.lua | 184 ----------------------------------------
>  package/prosody/prosody.mk      |  11 ---
>  2 files changed, 195 deletions(-)
>  delete mode 100644 package/prosody/prosody.cfg.lua

I'd like to have the opinion of the package submitter, Dushara
Jayasinghe, on this patch. Dushara, can you comment on why you added a
custom prosody.cfg, as opposed to using the one provided in the
upstream package?

Note: if there is no feedback from Dushara, I'll apply Fran?ois patch.
My preference obviously goes to using an example configuration file
provided by the upstream package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
