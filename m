From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 18:40:36 +0200
Subject: [Buildroot] [PATCH-2021.02.x] package/tar: add upstream
 security fix for CVE-2021-20193
In-Reply-To: <20210409195418.8014-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Apr 2021 21:54:18 +0200")
References: <20210409195418.8014-1-peter@korsgaard.com>
Message-ID: <87h7ke3xff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > - CVE-2021-20193: A flaw was found in the src/list.c of tar 1.33 and
 >   earlier.  This flaw allows an attacker who can submit a crafted input file
 >   to tar to cause uncontrolled consumption of memory.  The highest threat
 >   from this vulnerability is to system availability

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
