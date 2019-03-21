From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 22 Mar 2019 00:03:23 +0100
Subject: [Buildroot] [RFC PATCH 1/1] ltp-testsuite: Enable build under
 musl
In-Reply-To: <20190321225756.12988-1-petr.vorel@gmail.com>
References: <20190321225756.12988-1-petr.vorel@gmail.com>
Message-ID: <20190321230321.GA13904@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> + backport upstream patch 6511fcf26 ("Define __SIGRTMIN and __SIGRTMAX
Obviously I haven't been careful when updating commit message during amending.
> for MUSL") and add 8 upstreamed patches (to be included in a next release
> after 20190115) and 1 (10th) not yet upstreamed.

Kind regards,
Petr
