From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:44:07 +0100
Subject: [Buildroot] [PATCH v3] package/libnss: fix build failure with
 ARM without NEON extension
In-Reply-To: <20191029120916.33876-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 29 Oct 2019 13:09:16 +0100")
References: <20191029120916.33876-1-giulio.benetti@benettiengineering.com>
Message-ID: <87k18k4ml4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > At the moment libnss assumes that every ARM has NEON extension but it's
 > not that way. So add a patch to make it aware of it and use native
 > functions in place of NEON optimized ones.

 > Fixes:
 > http://autobuild.buildroot.net/results/1342d305d1aeebef7af54a83afc094fda12421e2/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > V1-> V2:
 > * added Fixes to commit log
 > * fixed #ifdef statement in patch
 > V2-> V3:
 > * fixed #ifdef statement again according to upstream:
 > https://bugzilla.mozilla.org/show_bug.cgi?id=1590676

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
