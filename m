From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 23:20:35 +0100
Subject: [Buildroot] [PATCH] libcec: not available on pure static builds
In-Reply-To: <1393107056-29830-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 22 Feb 2014 23:10:56 +0100")
References: <1393107056-29830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sirardqk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > libcec needs libdl, so it cannot work on pure static builds.
 > Fixes:

 >   http://autobuild.buildroot.org/results/670/670ce46627daaa4ae9ecdb8ffb6f97d0574354d4/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
