From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 10:00:04 +0100
Subject: [Buildroot] [PATCH] dhcpcd: disable on static library builds
In-Reply-To: <1392972890-21552-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 21 Feb 2014 09:54:50 +0100")
References: <1392972890-21552-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878ut4x2ln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > dhcpcd uses dlopen(), so it is not compatible with pure static library
 > builds.

 > Fixes:

 >   http://autobuild.buildroot.net/results/512/51249e8d3487e17bb6a60a99dcbd461f7b591eac/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
