From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:29:14 +0200
Subject: [Buildroot] [PATCH] perl: fix build of native modules
In-Reply-To: <1410979865-26207-1-git-send-email-francois.perrad@gadz.org>
References: <1410979865-26207-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140921212914.0217edab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed, 17 Sep 2014 20:51:05 +0200, Francois Perrad wrote:
> CORE/vutil.h is required when the host perl version is 5.20
> see http://autobuild.buildroot.net/results/c3d/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/
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
