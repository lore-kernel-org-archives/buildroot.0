From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:14:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix build with c99 and
 above compilers
In-Reply-To: <77h6nf0oxQxZiMllMN73fCQn07DZqLnfhClIcPrhY3sjad303S0Z8W77XaYAFCT1IbAbZFAPgX2jt2xAfCkecSZscDO0xAZCebaQFOMkbAc=@protonmail.com>
References: <77h6nf0oxQxZiMllMN73fCQn07DZqLnfhClIcPrhY3sjad303S0Z8W77XaYAFCT1IbAbZFAPgX2jt2xAfCkecSZscDO0xAZCebaQFOMkbAc=@protonmail.com>
Message-ID: <20200813231452.1f6e4962@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yair,

On Mon, 10 Aug 2020 08:43:32 +0000
Yair Ben-Avraham <yairba@protonmail.com> wrote:

> - fix build inline functions
> - fix signature path
> 
> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>

Since I haven't heard back from you about the C99 build issue, I've
applied a commit that just fixes the signature URL:

  https://git.buildroot.org/buildroot/commit/?id=a9b454387cdc60a69fc2bac8a24d0e2cf3c5ddb3

Do not hesitate to get back to us with more details about the
C99/-fgnu89-inline issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
