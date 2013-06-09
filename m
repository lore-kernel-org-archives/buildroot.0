From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Jun 2013 20:59:59 +0200
Subject: [Buildroot] [PATCH] am33x-cm3: Enforce correct -march option
In-Reply-To: <1370775458-31863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Jun 2013 12:57:38 +0200")
References: <1370775458-31863-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txl79kk0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Buildroot uses a normal ARM compiler to build the AM33X CM3 firmware
 Thomas> (which runs on a Cortex-M3 processor), but Buildroot will have a
 Thomas> default -march value that doesn't necessarily match the one needed for
 Thomas> Cortex-M3, leading to build failures (gcc complains that the
 Thomas> -mcpu=cortex-m3 option being passed is not compatible with the
 Thomas> selected -march).

 Thomas> Fix this by explicitly indicating -march=armv7-m.

Committed, thanks.

-- 
Bye, Peter Korsgaard
