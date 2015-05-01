From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:53:04 +0200
Subject: [Buildroot] [PATCH v7 13/13] qmx6_defconfig: update
In-Reply-To: <1430406748-8493-14-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-14-git-send-email-jezz@sysmic.org>
Message-ID: <20150501225304.4bd64c3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:28 +0200, J?r?me Pouiller wrote:
> - Update kernel
> - Add u-boot configuration
> - 6q_bootscript.txt is no more needed by new version of u-boot
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> [build test only]
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  board/congatec/qmx6/6q_bootscript.txt |  2 --
>  board/congatec/qmx6/post-build.sh     |  7 -------
>  configs/qmx6_defconfig                | 25 +++++++++++++++++++++----
>  3 files changed, 21 insertions(+), 13 deletions(-)
>  delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
>  delete mode 100755 board/congatec/qmx6/post-build.sh

Applied, thanks.

Stephan, if you could do a build + run test of this new defconfig on
your Congatec i.MX6 platform, it would be great.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
