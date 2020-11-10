From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 23:18:03 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/cups-filters: fix deamon
 path for cups service
In-Reply-To: <20201108163350.1138873-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Sun, 8 Nov 2020 17:33:49 +0100")
References: <20201108163350.1138873-1-angelo@amarulasolutions.com>
Message-ID: <87ft5gonz8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > Fix a typo in service location, the right location is indeed /usr/bin.

/usr/sbin, not /usr/bin.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
