From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:49:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: fix a typo
In-Reply-To: <1446662767-15730-1-git-send-email-nrubinstein@aldebaran.com>
References: <1446662767-15730-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20151104214949.70e20041@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Wed,  4 Nov 2015 19:46:06 +0100, No? Rubinstein wrote:
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  package/nginx/nginx.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks!

For the second patch, it would be good if someone could modify makedevs
to not accept user/group specified as strings, since resolving them
from the host point of view doesn't make any sense.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
