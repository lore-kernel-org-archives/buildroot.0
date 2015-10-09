From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:00:33 +0200
Subject: [Buildroot] [PATCH v6 2/3] opencv3: use
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS instead of replicate python-numpy
 depends
In-Reply-To: <1444203799-16230-2-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
 <1444203799-16230-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151009230033.175991aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Wed,  7 Oct 2015 09:43:18 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Opencv3 select python-numpy. To reduce CPU arch dependencies, an hidden 
> variable has been added to python-numpy package. This patch propagate this
> modification.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/opencv3/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
