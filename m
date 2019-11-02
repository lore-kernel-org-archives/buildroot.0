From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 2 Nov 2019 07:00:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/iputils: enable systemd
 services
In-Reply-To: <87imo3hoks.fsf@dell.be.48ers.dk>
References: <20191101061802.106261-1-james.hilliard1@gmail.com>
 <87imo3hoks.fsf@dell.be.48ers.dk>
Message-ID: <20191102060031.GA16637@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> As mentioned, it doesn't make sense to disable infod and install the
> service file under the same conditional.
Sorry, for missing obvious error.

> The problem is really that negative logic is confusing, so I've changed
> it to use positive logic (IPUTILS_NINFOD=y) and committed, thanks.
+1. IPUTILS_NINFOD = n you did in the end is more readable.

Kind regards,
Petr
