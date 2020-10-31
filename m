From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:44:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/sispmctl: fix build with gcc 4.8
In-Reply-To: <20201029130031.58927-1-fontaine.fabrice@gmail.com>
References: <20201029130031.58927-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031234413.6da0582e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Oct 2020 14:00:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rc-schedule.c-fix-build-with-gcc-4.8.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/sispmctl/0001-src-schedule.c-fix-build-with-gcc-4.8.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
