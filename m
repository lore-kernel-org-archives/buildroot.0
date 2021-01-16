From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:01:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/olsr: fix build of pud plugin
In-Reply-To: <20210107070332.388993-1-fontaine.fabrice@gmail.com>
References: <20210107070332.388993-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116230121.4d85c9af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Jan 2021 08:03:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build of pud plugin which was added with commit
> 318d160fe5b080e421dc133dff82d5ea2cf7d893
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5b598d728e6aae61b295681b0d7777e83074fecd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ud-adapt-to-API-changes-in-gpsd-3-20.patch | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 package/olsr/0003-pud-adapt-to-API-changes-in-gpsd-3-20.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
