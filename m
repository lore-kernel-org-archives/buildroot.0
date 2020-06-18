From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:16:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/minizip: fix static build of
 demos with openssl
In-Reply-To: <20200614164925.282394-1-fontaine.fabrice@gmail.com>
References: <20200614164925.282394-1-fontaine.fabrice@gmail.com>
Message-ID: <20200618221658.1307bacf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jun 2020 18:49:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/2f11b237a3577df55bc1ee139ed4d51f3ee4e08d
>  - http://autobuild.buildroot.org/results/b54b625751a45d3b449fffcdfaa06fb9209b4652
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...s.txt-use-pkg-config-to-find-openssl.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/minizip/0001-CMakeLists.txt-use-pkg-config-to-find-openssl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
