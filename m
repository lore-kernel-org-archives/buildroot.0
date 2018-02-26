From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:45:27 +0100
Subject: [Buildroot] [PATCH 1/2] php: add patch to fix build on
 static-only systems
In-Reply-To: <20180226203429.25294-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 26 Feb 2018 21:34:28 +0100")
References: <20180226203429.25294-1-thomas.petazzoni@bootlin.com>
Message-ID: <878tbfqsjc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a patch to PHP to fix the build on static-only
 > system, a regression introduced in PHP recently.

 > Fixes:

 >   http://autobuild.buildroot.net/results/fbf7ebbb9502424727006f39e169ec1ee870186d/

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
