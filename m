From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:08:59 +0100
Subject: [Buildroot] [PATCH 1/2] linux: bump CIP kernel to version
 4.19.152-cip37
In-Reply-To: <20201108212941.1332291-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Sun, 8 Nov 2020 22:29:40 +0100")
References: <20201108212941.1332291-1-angelo@amarulasolutions.com>
Message-ID: <87mtzqs36s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch bumps Linux CIP to version 4.19.152-cip37
 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  linux/Config.in | 4 ++--

You are missing the update in linux.hash.

-- 
Bye, Peter Korsgaard
