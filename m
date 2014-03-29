From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:32:00 +0100
Subject: [Buildroot] [V2] pkg-perl: prevents the interactive prompts
In-Reply-To: <1395340542-23383-1-git-send-email-francois.perrad@gadz.org>
References: <1395340542-23383-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140329103200.1894e6db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 20 Mar 2014 19:35:42 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk |    4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks!

Speaking of the perl-package infrastructure, we don't have any target
perl-package in the tree as of today. Would it be possible to add at
least a few of them, at least to make sure the perl-package
infrastructure is regularly exercised by the autobuilder tests?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
