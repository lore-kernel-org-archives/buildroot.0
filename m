From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:34:36 +0100
Subject: [Buildroot] [PATCH for-next] Makefile: delete default rules
In-Reply-To: <20161105210508.7930-1-arnout@mind.be>
References: <20161105210508.7930-1-arnout@mind.be>
Message-ID: <20161105233436.764c9d44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 22:05:08 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We don't use the default implicit rules that are added by make, so
> they just slow down the Makefile processing. The default implicit
> rules can be removed by defining an empty .SUFFIXES: target.
> 
> This speeds up the start of the build on my machine from 5.6s to
> 4.9s.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
