From: Lubomir Rintel <lkundrak@v3.sk>
Date: Tue,  1 Oct 2019 14:06:30 +0200
Subject: [Buildroot] [PATCH v2 0/3] configs,board: add OLPC XO laptops
Message-ID: <20191001120633.254585-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With few consumer distros remaining to support the Geode-based systems,
let alone optimize for them, Buildroot is a very handy way to make good
use of a rather uniquely engineered XO-1 laptop. Also, with 5.3 kernel,
the XO-1.75 is in a pretty good shape.

Let's add support for both machines.

Compared to the previous iteration of the set, this is merely updated
to use a newer kernel and not use deprecated options.

Thanks,
Lubo
