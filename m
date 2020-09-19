From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:57:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/wampcc: fix build with gcc 10
In-Reply-To: <20200919163307.468763-1-fontaine.fabrice@gmail.com>
References: <20200919163307.468763-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919215752.74db93aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020 18:33:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/5668ee2a81daba689cc16c520681cfd16a79dbd7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../wampcc/0003-Broken-build-on-Windows.patch | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/wampcc/0003-Broken-build-on-Windows.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
