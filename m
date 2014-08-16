From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:28:04 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix build
In-Reply-To: <1408173070-18811-1-git-send-email-francois.perrad@gadz.org>
References: <1408173070-18811-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140816092804.14c79131@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 16 Aug 2014 09:11:10 +0200, Francois Perrad wrote:
> the new option OPTIMIZE needs the same replacement.
> 
> see http://autobuild.buildroot.net/results/278f9d121273a16cedc009c0b8df0a8659d8fb73/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-net-ssleay/perl-net-ssleay.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
