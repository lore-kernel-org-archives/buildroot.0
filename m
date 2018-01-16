From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 23:25:43 +0100
Subject: [Buildroot] [PATCH-2017.11.x] linux-firmware: fix install for
 Chelsio T[45]
In-Reply-To: <1516067633-25511-1-git-send-email-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Mon, 15 Jan 2018 23:53:53 -0200")
References: <1516067633-25511-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <87fu75e908.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > It's broken since 1c9846ec "linux-firmware: Bump to the latest version"
 > Fix it by updating the name of the file to install.
 > Do not use * since it would install also old versions that would take
 > 1MB extra space in the target.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
