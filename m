From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:35:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with boost
 1.70.0
In-Reply-To: <20190418092907.24174-1-fontaine.fabrice@gmail.com>
References: <20190418092907.24174-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420163500.6dd114d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 11:29:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - No autobuilders failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-for-boot-1-70-get_io_service.patch.patch | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
