From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Dec 2020 12:19:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: fix build without threads
In-Reply-To: <20201215065155.46439-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Dec 2020 07:51:55 +0100")
References: <20201215065155.46439-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1nquhfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of git version >= 2.29.0 without threads
 > Fixes:
 >  - http://autobuild.buildroot.org/results/d41638d1ad8e78dd6f654367c905996b838ee649

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
