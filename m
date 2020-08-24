From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 22:08:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipmitool: fix build with gcc 10
In-Reply-To: <20200824182438.1940277-1-fontaine.fabrice@gmail.com>
References: <20200824182438.1940277-1-fontaine.fabrice@gmail.com>
Message-ID: <20200824220820.44b9ba99@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Aug 2020 20:24:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/b6231d601d6051c97d3c2a0ed3065df03648c40d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...g-move-variable-definition-to-c-file.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/ipmitool/0007-hpmfwupg-move-variable-definition-to-c-file.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
