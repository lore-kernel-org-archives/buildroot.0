From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:07:16 +0100
Subject: [Buildroot] [PATCH 2/5] support/scripts/pkg-stats: support
 generating stats based on configured packages
In-Reply-To: <20201105163024.1387248-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 5 Nov 2020 17:30:20 +0100")
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
 <20201105163024.1387248-3-thomas.petazzoni@bootlin.com>
Message-ID: <87ft5gkv8b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > pkg-stats was initially a Buildroot maintenance oriented tool: it was
 > designed to examine all Buildroot packages and provide
 > statistics/details about them.

 > However, it turns out that a number of details provided by pkg-stats,
 > especially CVEs, are relevant also for Buildroot users, who would like
 > to check regularly if their specific Buildroot configuration is
 > affected by CVEs or not, and possibly check if all packages have
 > license information, license files, etc.

 > The cve-checker script was recently introduced to provide an output
 > relatively similar to pkg-stats, but focused on CVEs only.

 > But in fact, its main difference is on the set of packages that we
 > consider: pkg-stats considers all packages, while cve-checker uses
 > "make show-info" to only consider packages enabled in the current
 > configuration.

 > So, this commit introduces a -c option to pkg-stats, to tell pkg-stats
 > to generate its output based on the list of configured packages. -c is
 > mutually exclusive with the -p option (explicit list of packages) and
 > -n option (a number of packages, picked randomly).
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
