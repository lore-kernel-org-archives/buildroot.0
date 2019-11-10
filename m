From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 14:33:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/glog: disable on microblaze
In-Reply-To: <20191109225140.27689-1-fontaine.fabrice@gmail.com>
References: <20191109225140.27689-1-fontaine.fabrice@gmail.com>
Message-ID: <20191110143309.7abbcafc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Nov 2019 23:51:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable glog on microblaze instead of trying to fix the build failure
> due to __ELF__ being undefined on this architecture following Arnout
> request during review of https://patchwork.ozlabs.org/patch/1186107
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ae138c08361d3544df92f88edf3f6dcd617b6232
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glog/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

I've added a comment in the Config.in file to explain why it's disabled
on Microblaze, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
