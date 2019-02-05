From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 15:19:16 +0100
Subject: [Buildroot] [PATCH v2] package/qpid-proton: openssl 1.1.x
 compatibility
In-Reply-To: <1549370334-63760-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 06:38:54 -0600")
References: <1549370334-63760-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87bm3qnwrf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Updates are based on the original bug report upstream.
 > https://issues.apache.org/jira/browse/PROTON-1326

 > Fixes
 > http://autobuild.buildroot.net/results/f90/f9085f223cd54c70daf29b12e6c66edb416f7243/

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > I attempted to pull this package forward to a newer version but things broke
 > even worse, we are quite behind at 0.9.x when latest is 0.26.x.

 > Changes
 > v1 -> v2
 >  - Fixed libressl define issues with security levels

Committed, thanks.

-- 
Bye, Peter Korsgaard
