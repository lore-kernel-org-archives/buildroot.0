From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 May 2014 21:19:37 +0200
Subject: [Buildroot] [PATCH v2] libnss: Disable for MIPS64 n32 platforms
In-Reply-To: <1399970774-9697-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Tue, 13 May 2014 09:46:14 +0100")
References: <1399970774-9697-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d2fdr0om.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This package fails to compile for MIPS64 n32 platforms. We are in
 > conversations with upstream to fix this problem. Meanwhile we disable
 > this package until we fix it.

 > Fixes:
 >    http://autobuild.buildroot.net/results/0e3/0e3f1482d6f2f9bddc53d4e78b575120a2729e1d/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
