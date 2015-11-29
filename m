From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:52:08 +0100
Subject: [Buildroot] [PATCH] gpsd: work-around ICE when compiling for
 microblaze with GCC5
In-Reply-To: <1448207004-6959-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448207004-6959-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151129145208.282e7c2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Sun, 22 Nov 2015 13:43:24 -0200, Sergio Prado wrote:
> GCC 5.X generates an ICE when compiling gpsd for microblaze due
> to optimizations, so lets disable it for now to works around
> this problem.
> 
> A bug was reported to the gcc bug tracker:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/gpsd/gpsd.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
