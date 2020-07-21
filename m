From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:06:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/jq: bump version to a17dd32
In-Reply-To: <20200705182845.42885-1-lylejfranklin@gmail.com> (lylejfranklin's
 message of "Sun, 5 Jul 2020 14:28:45 -0400")
References: <20200705182845.42885-1-lylejfranklin@gmail.com>
Message-ID: <87blk9o10i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "lylejfranklin" == lylejfranklin  <lylejfranklin@gmail.com> writes:

 > From: Lyle Franklin <lylejfranklin@gmail.com>
 > - Bumps jq package to latest to fix seg fault errors
 > - https://github.com/stedolan/jq/issues/2003
 > - I saw this on ARM64 compiled with uclibc, issue mentions MIPS, so
 >   might only be an issue for non-x86

 > Signed-off-by: Lyle Franklin <lylejfranklin@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
