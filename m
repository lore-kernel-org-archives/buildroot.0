From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:53:31 +0200
Subject: [Buildroot] [PATCH] uboot: check various configuration
	parameters and bail out if empty
In-Reply-To: <1400618551-24883-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 22:42:31 +0200")
References: <1400618551-24883-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx8kf76s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Following the issues reported by Jerry <g4@novadsp.com>, it appears
 > that there are a number of U-Boot configuration variables we are not
 > checking properly, leaving users with weird behavior at build time.

 > This commit extends the existing U-Boot checks to verify that when a
 > custom version, custom tarball, or custom Git or Mercurial
 > repositories are selected, the appropriate fields are not empty in the
 > configuration.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
