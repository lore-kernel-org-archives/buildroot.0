From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 22:27:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/gkrellm: fix build with NLS
In-Reply-To: <20210114193544.1965646-1-fontaine.fabrice@gmail.com>
References: <20210114193544.1965646-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114222754.4e319320@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 20:35:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/98d0eda546b09e60eebbd3c3a28493f09dff7e62
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gkrellm/gkrellm.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
