From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jun 2020 22:02:26 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 7.1.2
In-Reply-To: <20200607161519.133543-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Sun, 7 Jun 2020 18:15:19 +0200")
References: <20200607161519.133543-1-angelo@amarulasolutions.com>
Message-ID: <87y2oy8x0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This package bumps python-pillow to version 7.1.2.
 > It updates also the LICENSE hash cause of a copyright year update.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

I see the changelog mentions various buffer overflow fixes. Is this
something that should be backported to 2020.02 / 2020.05?

https://github.com/python-pillow/Pillow/blob/master/CHANGES.rst

-- 
Bye, Peter Korsgaard
