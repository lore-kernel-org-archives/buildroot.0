From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 21:30:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/glorytun: fix build without
 cpuid.h
In-Reply-To: <20191010165653.32018-1-fontaine.fabrice@gmail.com>
References: <20191010165653.32018-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010213009.3aa40bbf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 18:56:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/2617bf58146caeaf3c1b17171dbce09217fb7a2d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../glorytun/0001-Check-for-cpuid.h-too.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/glorytun/0001-Check-for-cpuid.h-too.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
