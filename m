From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:44:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix build with
 kernel >= 5.2
In-Reply-To: <20190714232545.28892-1-fontaine.fabrice@gmail.com>
References: <20190714232545.28892-1-fontaine.fabrice@gmail.com>
Message-ID: <20190718224412.5965d491@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 01:25:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1b965c5d9c782d6689041eeeb7be3be4a4854346
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...x-build-after-y2038-changes-in-glibc.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/bluez5_utils/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
