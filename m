From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 4 Dec 2017 23:33:16 +0300
Subject: [Buildroot] [PATCH 8/8] support/testing: add tests for ATF
In-Reply-To: <20171203214811.3124-9-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-9-thomas.petazzoni@free-electrons.com>
Message-ID: <20171204203316.modja7pzite7vbhd@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 03, 2017 at 10:48:11PM +0100, Thomas Petazzoni wrote:
> These new tests only do build tests, but allow to quickly verify that
> the ATF/U-Boot combinations for vexpress, Allwinner and Marvell
> platforms all continue to build properly.

This patch made my day! I utterly missed the fact that
buildroot had gained this 'unit-test' kind of feature.

Regards,
Sergey
