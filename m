From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:38:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-protobuf: remove wheel
 dependency
In-Reply-To: <20200920090444.845776-1-fontaine.fabrice@gmail.com>
References: <20200920090444.845776-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920153817.58b84b72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 11:04:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove unneeded wheel dependency which has been added in version 3.13.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/371c686a10d6870933011b46d36b1879d29046b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....py-remove-unneeded-wheel-dependency.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch

Applied to master, thanks. Could you submit this upstream? Or at least
report the bug?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
