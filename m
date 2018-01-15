From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:08:33 +0100
Subject: [Buildroot] [PATCH 2/3] linux-firmware: fix install for Chelsio
 T[45]
In-Reply-To: <1515973281-3997-2-git-send-email-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 14 Jan 2018 21:41:20 -0200")
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
 <1515973281-3997-2-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <87shb6ubpa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > It's broken for the last 3 version bumps, since
 > 1c9846ecc9 "linux-firmware: Bump to the latest version"

 > Fix it by updating the name of the file to install.
 > Do not use * since it would install also old versions that would take
 > 1MB extra space in the target.

 > A comment to remember to update the file name when bumping the package
 > is not needed because a previous patch in the series makes the build
 > to fail for missing file.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Fabio Estevam <festevam@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > I don't have hardware to run-test the firmware itself.

Committed, thanks.

 > 2017.11.x and 2017.08.x should use t[45]fw-1.16.45.0.bin instead
 > 2017.05.x is OK

Thanks. Will you send a patch for 2017.11.x?

-- 
Bye, Peter Korsgaard
