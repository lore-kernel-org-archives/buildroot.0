From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2020 22:04:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/leveldb: turn snappy into an
 optional dependency
In-Reply-To: <20200518052203.1667697-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 18 May 2020 07:22:01 +0200")
References: <20200518052203.1667697-1-thomas.petazzoni@bootlin.com>
Message-ID: <87imgah7s3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > snappy is not a mandatory dependency to build leveldb. Back when it
 > was introduced in Buildroot, as of version 1.18, the build logic
 > already made snappy an optional dependency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
