From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 11:47:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: set python path
In-Reply-To: <20190420145533.15497-1-fontaine.fabrice@gmail.com>
References: <20190420145533.15497-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421114733.348c1fd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 16:55:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set python path to $(HOST_DIR)/usr/bin/python to avoid build failures if
> python3 found on host is broken
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1f878405593dd05bb00fe0b06ca1c64ffbe6c572
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/refpolicy/refpolicy.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
