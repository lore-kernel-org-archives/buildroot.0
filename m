From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:17:12 +0100
Subject: [Buildroot] [PATCH] utils/test-pkg: always run a global
 legal-info
In-Reply-To: <20180107225005.29898-1-yann.morin.1998@free.fr>
References: <20180107225005.29898-1-yann.morin.1998@free.fr>
Message-ID: <20180108091712.0a6af850@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 23:50:05 +0100, Yann E. MORIN wrote:
> Instead of limiting it to the package under test, we run it globally.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  utils/test-pkg | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
