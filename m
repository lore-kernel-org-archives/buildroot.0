From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 14:00:00 +0200
Subject: [Buildroot] [PATCH v4] package/python-matplotlib: add
 kiwisolver dependency
In-Reply-To: <20190930084741.4641-1-esben@geanix.com>
References: <20190930084741.4641-1-esben@geanix.com>
Message-ID: <20190930140000.7e4ae93e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Esben,

On Mon, 30 Sep 2019 10:47:41 +0200
Esben Haabendal <esben@geanix.com> wrote:

> This is needed by matplotlib.pyplot, and is also documented at
> https://matplotlib.org/users/installing.html#building-on-linux
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

This is exactly the same version as v2, which was exactly the same as
v3. Why do you resend the same patch multiple times ?

This version is in fact even less good than the v3, because you lost
the Reviewed-by from Yegor.

It seems like you keep sending new versions with no changes, just
because your patches haven't been applied. Your patches have been
applied because we have a backlog of ~350 patches. We can't lose any of
them, because they are recorded by patchwork.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
