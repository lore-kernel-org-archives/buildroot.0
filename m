From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 14:21:34 +0200
Subject: [Buildroot] [PATCH] infra/perl: switch to using a reliable
 mirror
In-Reply-To: <1405764559-11332-1-git-send-email-yann.morin.1998@free.fr>
References: <1405764559-11332-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140719142134.0a88409e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Jul 2014 12:09:19 +0200, Yann E. MORIN wrote:
> The mirror we currently use is not a mirror, it's the main archive.
> 
> It has a few shortcomings:
>   - it might not contain all the versions of the modules we use,
>   - it can be unavailable at times (like now, for example)
> 
> Switch to using a realmirror, that:
>   - does a round-robin on the actual mirror, so availability is better
>   - contains all versions of all modules (yes, mojolicious is there!)
> 
> As a consequence, switch mojolicious to use our standard mirror,
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Fran?ois Perrad <francois.perrad@gadz.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
