From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:57:31 +0200
Subject: [Buildroot] [PATCH 1/1] opencv3: Enable NEON and VFPV3
 optimizations
In-Reply-To: <1528360737-12613-1-git-send-email-mathieu.maret@gmail.com>
References: <1528360737-12613-1-git-send-email-mathieu.maret@gmail.com>
Message-ID: <20180607155731.1b2f740d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jun 2018 10:38:57 +0200, Mathieu Maret wrote:
> Signed-off-by: Mathieu Maret <mathieu.maret@gmail.com>
> ---
>  package/opencv3/opencv3.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
