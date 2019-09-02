From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 14:31:02 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5enginio/Config.in: depends
 before select
In-Reply-To: <20190815204341.29566-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 15 Aug 2019 22:43:41 +0200")
References: <20190815204341.29566-1-arnout@mind.be>
Message-ID: <87k1aqyj5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > In Config.in, we put 'depends' lines before 'select' lines, as reported
 > by check-package.

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/273215267

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
