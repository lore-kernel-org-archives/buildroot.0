From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:22:02 +0200
Subject: [Buildroot] [PATCH 1/2] iputils: Bump to version s20180629
In-Reply-To: <20180924001446.24617-1-petr.vorel@gmail.com>
References: <20180924001446.24617-1-petr.vorel@gmail.com>
Message-ID: <20180925222202.12451b57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Sep 2018 02:14:45 +0200, Petr Vorel wrote:
> Add upstream patch to fix build error:
> ping.c: In function ?main?:
> ping.c:212:23: error: ?AI_CANONIDN? undeclared (first use in this function); did you mean ?AI_CANONNAME??
>    hints.ai_flags &= ~ AI_CANONIDN;
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...ix-AI_CANONIDN-usage-on-some-systems.patch | 57 +++++++++++++++++++
>  package/iputils/iputils.hash                  |  2 +-
>  package/iputils/iputils.mk                    |  2 +-
>  3 files changed, 59 insertions(+), 2 deletions(-)
>  create mode 100644 package/iputils/0001-ping-Fix-AI_CANONIDN-usage-on-some-systems.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
