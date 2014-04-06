From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 17:12:44 +0200
Subject: [Buildroot] [PATCH] package/eudev: use new upstream patch to
 fix fcntl issue
In-Reply-To: <1396796688-31522-1-git-send-email-yann.morin.1998@free.fr>
References: <1396796688-31522-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140406171244.4e71811c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  6 Apr 2014 17:04:48 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This is upstream's third attempt at fixing the issue.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...e-87-fails-to-build-on-linux-headers-3.13.patch | 183 ++++++++++++++-------
>  1 file changed, 121 insertions(+), 62 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
