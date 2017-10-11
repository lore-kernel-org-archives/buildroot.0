From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 15:58:33 +0200
Subject: [Buildroot] [PATCH] prosody: new package
In-Reply-To: <20171011132140.22547-1-francois.perrad@gadz.org>
References: <20171011132140.22547-1-francois.perrad@gadz.org>
Message-ID: <20171011155833.215bbf35@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 15:21:40 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in            |  1 +
>  package/prosody/Config.in    | 17 +++++++++++++++++
>  package/prosody/prosody.hash |  2 ++
>  package/prosody/prosody.mk   | 38 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+)
>  create mode 100644 package/prosody/Config.in
>  create mode 100644 package/prosody/prosody.hash
>  create mode 100644 package/prosody/prosody.mk

We already have a prosody package submitted
http://patchwork.ozlabs.org/patch/820235/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
