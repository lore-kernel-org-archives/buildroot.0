From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:55:35 +0200
Subject: [Buildroot] [autobuild] autobuild-run: add
 br-sh4-full-2015.05/opencv exception
In-Reply-To: <1435262584-1192-1-git-send-email-s.martin49@gmail.com>
References: <1435262584-1192-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150704155535.28cb093d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 25 Jun 2015 22:03:04 +0200, Samuel Martin wrote:
> Avoid the following build failures:
> 
>   /tmp/ccCR4s15.s: Assembler messages:
>   /tmp/ccCR4s15.s:19880: Error: pcrel too far
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> This patch is related to this series:
>   http://lists.busybox.net/pipermail/buildroot/2015-June/130838.html
> ---
>  scripts/autobuild-run | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
