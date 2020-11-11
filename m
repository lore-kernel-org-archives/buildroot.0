From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:05:41 +0100
Subject: [Buildroot] [PATCH 1/5] support/scripts/pkg-stats: allow to run
 script outside of the top-level directory
In-Reply-To: <20201105163024.1387248-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 5 Nov 2020 17:30:19 +0100")
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
 <20201105163024.1387248-2-thomas.petazzoni@bootlin.com>
Message-ID: <87k0uskvay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Currently, pkg-stats expects being executed from Buildroot's top-level
 > source directory. As we are going to extend pkg-stats to cover only
 > the packages available in the current configuration, it makes sense to
 > be able to run it from the output directory, which can be anywhere
 > compared to Buildroot's top-level directory.

 > This commit adjusts pkg-stats to this, by inferring all Buildroot
 > paths based on the location of the pkg-stats script itself.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
