From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:24:52 +0200
Subject: [Buildroot] [PATCH] package/kf5-kcoreaddons: make passing
 CXXFLAGS to cmake clearer
In-Reply-To: <20191001090832.43400-1-giulio.benetti@benettiengineering.com>
References: <20191001090832.43400-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191008232452.2d8c45c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 11:08:32 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Better to keep final assignment to *_CONF_OPTS after all assignements to
> KF5_KCOREADDONS_CXXFLAGS have been done. So move _CONF_OPTS assignment
> after -latomic assignment.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
