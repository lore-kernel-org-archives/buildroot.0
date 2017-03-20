From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:51:02 +0100
Subject: [Buildroot] [PATCH] libv4l: drop -lrt workaround
In-Reply-To: <0adbe5c3ad4320e08603e514825b1222416f1846.1490042201.git.baruch@tkos.co.il>
References: <0adbe5c3ad4320e08603e514825b1222416f1846.1490042201.git.baruch@tkos.co.il>
Message-ID: <20170320215102.288eab9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 22:36:41 +0200, Baruch Siach wrote:
> libv4l adds the -lrt flag since upstream commit 3dcb945bfcab
> ("v4l2-compliance: Explicitely link against rt library").
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libv4l/libv4l.mk | 2 --
>  1 file changed, 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
