From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Aug 2020 16:41:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix build with c99 and
 above compilers
In-Reply-To: <77h6nf0oxQxZiMllMN73fCQn07DZqLnfhClIcPrhY3sjad303S0Z8W77XaYAFCT1IbAbZFAPgX2jt2xAfCkecSZscDO0xAZCebaQFOMkbAc=@protonmail.com>
References: <77h6nf0oxQxZiMllMN73fCQn07DZqLnfhClIcPrhY3sjad303S0Z8W77XaYAFCT1IbAbZFAPgX2jt2xAfCkecSZscDO0xAZCebaQFOMkbAc=@protonmail.com>
Message-ID: <20200810164136.3fe8aaad@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 08:43:32 +0000
Yair Ben-Avraham <yairba@protonmail.com> wrote:

> - fix build inline functions
> - fix signature path
> 
> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>

It seems weird that a well-maintained piece of software such as RAUC
has build issues with C99+ compilers.

Do you have a reference to the build failure ? In our autobuilders
perhaps ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
