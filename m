From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:42:49 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
In-Reply-To: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150702234249.735e9006@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 2 Jul 2015 17:52:13 +0200, Vicente Olivert Riera wrote:
> This is necessary for some packages depending on valgrind, such as
> libdrm which will fail with an error like this one:
> 
> checking for VALGRIND... no
> checking whether to enable Valgrind support... configure: error:
> Valgrind support required but not present
> package/pkg-generic.mk:146: recipe for target
> '/br/output/build/libdrm-2.4.62/.stamp_configured' failed
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/valgrind/valgrind.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
