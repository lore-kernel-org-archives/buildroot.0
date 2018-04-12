From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 22:35:56 +0200
Subject: [Buildroot] [PATCH 2/4] imx: make post-image.sh arm64 compatible
In-Reply-To: <1523536525-10280-2-git-send-email-karl.erik.larsson@gmail.com>
References: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
 <1523536525-10280-2-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180412223556.7672d125@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 14:35:23 +0200, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
> ---
>  board/freescale/common/imx/post-image.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I've applied after adding more details in the commit log and tweaking
the commit title. See
https://git.buildroot.org/buildroot/commit/?id=4755bf2bd43a7b4c3bf4f88be790240a01b3116f.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
