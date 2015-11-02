From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 20:59:19 +0100
Subject: [Buildroot] [PATCH v1] x265: needs threads
In-Reply-To: <1446330228-28495-1-git-send-email-ps.report@gmx.net>
References: <1446330228-28495-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151102205919.3c2c5aba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat, 31 Oct 2015 23:23:48 +0100, Peter Seiderer wrote:
> Fixes [1]:
> 
>   build/x265-1.8/source/common/threading.h:34:21: fatal error: pthread.h: No such file or directory
> 
> [1] http://autobuild.buildroot.net/results/261/26134a234be5a67914cde0fb81601f6860d943d2
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/x265/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
