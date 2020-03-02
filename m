From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:42:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/rocksdb: fix C++ tests
In-Reply-To: <20200224105457.3680948-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 24 Feb 2020 11:54:57 +0100")
References: <20200224105457.3680948-1-fontaine.fabrice@gmail.com>
Message-ID: <87eeuacrb4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This will fix a build failure on xtensa and nios2 that missed
 > -faligned-new

 > Fixes:
 >  - http://autobuild.buildroot.org/results/58bf25a16984c4d5f3ce0e26a56712410b67c53a
 >  - http://autobuild.buildroot.org/results/718fee3d20ef00ffa5c3e617a036cf2b82c97411

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
