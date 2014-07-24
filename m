From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:31:08 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <1406225756-29824-1-git-send-email-francois.perrad@gadz.org>
References: <1406225756-29824-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140724223108.62b38bd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 24 Jul 2014 20:15:56 +0200, Francois Perrad wrote:
> CCFLAGS needs the same replacement as LDDLFAGS
> 
> see http://autobuild.buildroot.net/results/299/299d6fa6b2ccf97987ffd9c99130c25dd55ca9b4/
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
