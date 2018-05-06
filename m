From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 09:15:15 +0200
Subject: [Buildroot] [PATCH v2,1/1] libupnpp: fix build with uclibc
In-Reply-To: <20180504160133.5420-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 4 May 2018 18:01:33 +0200")
References: <20180504160133.5420-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvrlqmpo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add patch to avoid failing with error if host_os doesn't start with
 > linux

 > Fixes:
 >  - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
 >  - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update patch to check for uclinux instead of assuming that default is
 >    linux

Committed, thanks.

 > +Fixes:
 > + - http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8
 > + - http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86
 > +
 > +[Sent upstream]: https://opensourceprojects.eu/p/libupnpp/code/merge-requests/3

Something apparently went wrong. That page shows:

Fabrice Fontaine would like you to merge 0 commits.

-- 
Bye, Peter Korsgaard
