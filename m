From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jun 2016 14:33:06 +0200
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Add NODEJS_CONF_OPTS
In-Reply-To: <1464981346-11741-1-git-send-email-martin@barkynet.com>
References: <1464981346-11741-1-git-send-email-martin@barkynet.com>
Message-ID: <20160604143306.64edbcd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jun 2016 20:15:43 +0100, Martin Bark wrote:
> Most packages in buildroot pass a FOO_CONF_OPTS variable into the
> configure script.  Transition nodejs to follow this convention.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/nodejs.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
