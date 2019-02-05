From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 15:26:10 +0100
Subject: [Buildroot] [PATCH] package/mender: fixing init script naming
In-Reply-To: <1549376201-16547-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Tue, 5 Feb 2019 15:16:41 +0100")
References: <1549376201-16547-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <8736p2nwfx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > The installed systemv script should be name S42mender and not S04mender.

You forgot to explain _WHY_, E.G. that mender needs the network to be up
before it starts (presumably?)

-- 
Bye, Peter Korsgaard
