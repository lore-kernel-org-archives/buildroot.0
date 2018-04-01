From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 19:39:47 +0200
Subject: [Buildroot] [PATCH] package/snort: select libdnet package
In-Reply-To: <20180401172739.31509-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 1 Apr 2018 19:27:39 +0200")
References: <20180401172739.31509-1-romain.naour@gmail.com>
Message-ID: <87h8ourfks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > "libdnet is in the dependency chain of snort that has added it to its
 > _DEPENDENCIES variable without selecting it or depending on it from
 > Config.in"

 > Fixes:
 > http://autobuild.buildroot.net/results/9cf/9cf5883d1ed95d3d76d529a9a25f0e600adf25cd

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Sergio Prado <sergio.prado@e-labworks.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
