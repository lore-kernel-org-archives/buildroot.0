From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Jan 2019 21:10:41 +0100
Subject: [Buildroot] [PATCH 2/4] package/libopusenc: bump to version
 0.2.1
In-Reply-To: <20190101143702.2736-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 1 Jan 2019 15:37:00 +0100")
References: <20190101143702.2736-1-thomas.petazzoni@bootlin.com>
 <20190101143702.2736-2-thomas.petazzoni@bootlin.com>
Message-ID: <87ef9wqgu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This release fixes two minor bugs:
 > - a gapless bug in the LPC filtering
 > - a crash on destroy when using the pull API

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

Does this depend on opus 1.3 / should this be added to the 2018.02.x /
2018.11.x branches?

-- 
Bye, Peter Korsgaard
