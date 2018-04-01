From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 16:42:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/pkg-golang: drop the fixed
 <pkg>_BINDIR variable
In-Reply-To: <20180401115136.1345-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Apr 2018 13:51:36 +0200")
References: <20180401115136.1345-1-thomas.petazzoni@bootlin.com>
 <20180401115136.1345-2-thomas.petazzoni@bootlin.com>
Message-ID: <87370frnso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Now that <pkg>_BINDIR is always "bin", having it as a package variable
 > doesn't make much sense, so get rid of this variable completely, and
 > use "bin".

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
