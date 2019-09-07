From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:42:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: fix build with
 glibc 2.30
In-Reply-To: <20190905170403.3067-1-fontaine.fabrice@gmail.com>
References: <20190905170403.3067-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907234233.74bf0781@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Sep 2019 19:04:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8680c5a355b226cf978397615cbe5df1c5f8c656
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Fix-namespace-our-gettid-wrapper.patch | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/lttng-tools/0001-Fix-namespace-our-gettid-wrapper.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
