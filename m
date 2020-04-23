From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 23:26:40 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/iwd: fix build with glibc < 2.24
In-Reply-To: <20200422081628.4181172-1-fontaine.fabrice@gmail.com>
References: <20200422081628.4181172-1-fontaine.fabrice@gmail.com>
Message-ID: <20200423232640.64e029c7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 10:16:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/63f983aa22ca5303a55bc55e004f05a94e5f7259
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Fix commit title and message: issue is due to glibc, not gcc

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
