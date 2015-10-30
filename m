From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Oct 2015 15:10:50 +0100
Subject: [Buildroot] [PATCH] host-perl: fix patching
In-Reply-To: <1446059858-2646-1-git-send-email-francois.perrad@gadz.org>
References: <1446059858-2646-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151030151050.6dea8243@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 28 Oct 2015 20:17:38 +0100, Francois Perrad wrote:
> see http://autobuild.buildroot.net/results/c8e/c8e6bbe50ca71835bdde9503a9fe23ace8236a09/
> 
> the newest patches are against perl-cross,
> so we need to extract perl-cross in the host-perl case.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
