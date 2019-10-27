From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:33:15 +0100
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: test
 configurations with BR2_PIC_PIE
In-Reply-To: <20191026084221.10895-1-fontaine.fabrice@gmail.com>
References: <20191026084221.10895-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027113315.54403028@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat, 26 Oct 2019 10:42:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 2 ++
>  1 file changed, 2 insertions(+)

This is starting to cause build failures (of course). Perhaps you
should monitor:

  http://autobuild.buildroot.net/index.php?status=NOK&symbols[BR2_PIC_PIE]=y

Not all build failures are related to BR2_PIC_PIE of course, but some
of them clearly are.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
