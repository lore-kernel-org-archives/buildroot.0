From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:04:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/leveldb: fix detection of the
 snappy library
In-Reply-To: <20200518052203.1667697-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 18 May 2020 07:22:02 +0200")
References: <20200518052203.1667697-1-thomas.petazzoni@bootlin.com>
 <20200518052203.1667697-2-thomas.petazzoni@bootlin.com>
Message-ID: <87eeqyh7rv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Pull a patch pending in an upstream pull request to fix the detection
 > of the snappy library when we are in static linking configurations.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12671

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
