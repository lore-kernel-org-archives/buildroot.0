From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:08:04 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: fix buid with older cmake
In-Reply-To: <20181011190429.22484-1-fontaine.fabrice@gmail.com>
References: <20181011190429.22484-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011220804.32dc4805@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 21:04:29 +0200, Fabrice Fontaine wrote:
> Old version of cmake break cross-compilation when FindThreads is used
> because of a try_run call. Add a workaround that avoids try_run.
> 
> cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/784918c58310474e8b4a0b42850a55ba35a1a19e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xerces/xerces.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
