From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:56:04 +0200
Subject: [Buildroot] [PATCH] package/ltrace: do not enable libunwind
 support for MIPS
In-Reply-To: <1439743426-3824-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1439743426-3824-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150825205604.3b5f085f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Sun, 16 Aug 2015 17:43:46 +0100, Vicente Olivert Riera wrote:
> Currently libunwind support in ltrace is broken for MIPS. I'm working
> with upstream to fix this issue, but it's not yet ready, so let's
> disable it by now.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/79b/79b51941ed57b0564c68112489b03cac39a04e9a/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ltrace/ltrace.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
