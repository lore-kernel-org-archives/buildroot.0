From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:04:14 +0200
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: test
 configurations with BR2_PIC_PIE
In-Reply-To: <20191026084221.10895-1-fontaine.fabrice@gmail.com>
References: <20191026084221.10895-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026150414.0ed388ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 10:42:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. Any reason why you randomized this only for
PIC_PIE, and not the other hardening options ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
