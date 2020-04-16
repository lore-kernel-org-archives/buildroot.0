From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 16 Apr 2020 11:59:51 +0200
Subject: [Buildroot] [PATCH v3 0/3] configs,board: add OLPC XO laptops
Message-ID: <20200416095954.364163-1-lkundrak@v3.sk>
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

Compared to the previous iteration of the set, this removes a large
amount of packages and kernel options that were enabled, based on review
feedback from Thomas Petazzoni. What is left is hopefully pretty much a
minimal configuration.

The patches apply on top of today's master. They were tested on XO-1 and
XO-1.75 laptops.

Thanks,
Lubo
