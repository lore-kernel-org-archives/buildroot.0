From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:09:12 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump CIP RT kernel to version
 4.19.152-cip37-rt16
In-Reply-To: <20201108212941.1332291-2-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Sun, 8 Nov 2020 22:29:41 +0100")
References: <20201108212941.1332291-1-angelo@amarulasolutions.com>
 <20201108212941.1332291-2-angelo@amarulasolutions.com>
Message-ID: <87imaes36f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch bumps Linux CIP RT to version 4.19.152-cip37-rt16
 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  linux/Config.in | 4 ++--

You are missing the update in linux.hash.

-- 
Bye, Peter Korsgaard
