From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:41:28 +0100
Subject: [Buildroot] [PATCH] cifs-utils: fix building on static
In-Reply-To: <1395671891-64769-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 24 Mar 2014 14:38:11 +0000")
References: <1395671891-64769-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87d2h8k587.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Disable position independent executables when building on static.
 > Fixes:
 >    http://autobuild.buildroot.net/results/bb0/bb00db98477f0f81c95ac1830ef3649b30963416/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
