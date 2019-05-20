From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 21:16:53 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20190514a
In-Reply-To: <20190520135239.19352-1-peter@korsgaard.com>
References: <20190520135239.19352-1-peter@korsgaard.com>
Message-ID: <20190520211653.20d64882@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 May 2019 15:52:39 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Includes MDS mitigation (RIDL, Fallout, Zombieload), INTEL-SA-00223
> 
> Move to the Intel github repo as this release is not yet available on
> downloadmirror.intel.com.
> 
> Update license hash because of copyright year and DOS/UNIX newlines change.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/intel-microcode/Config.in            | 2 ++
>  package/intel-microcode/intel-microcode.hash | 4 ++--
>  package/intel-microcode/intel-microcode.mk   | 6 ++----
>  3 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
