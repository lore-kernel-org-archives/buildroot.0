From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 23:25:10 +0200
Subject: [Buildroot] [PATCH 1/3] pckage/openpowerlink: fix sha256 hash
In-Reply-To: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
References: <1465420919-3920-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160608232510.78ab03df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 Jun 2016 23:21:57 +0200, Romain Naour wrote:
> While bumping to v2.4.0, the sha256 was commented by mistake
> and the hash was for v2.3.2 archive.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/openpowerlink/openpowerlink.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied, thanks! There was a typo in the title of
this patch, which I fixed when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
