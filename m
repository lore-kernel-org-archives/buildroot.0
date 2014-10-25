From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:07:46 +0200
Subject: [Buildroot] [PATCH] ruby: disable fiddle support for bfin
In-Reply-To: <1414094314-11429-1-git-send-email-ps.report@gmx.net>
References: <1414094314-11429-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141025110746.30a4b71a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 23 Oct 2014 21:58:34 +0200, Peter Seiderer wrote:
> Disable fiddle support because of compile failure (no ffi_closure support
> for bfin).
> 
> Fixes:
>  http://autobuild.buildroot.net/results/0a8/0a854274b520d4daca3911a64777a447b5756a52/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ruby/ruby.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
