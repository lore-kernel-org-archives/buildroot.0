From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:41:25 +0200
Subject: [Buildroot] [PATCH] gcc: switch microblaze to version 4.9.x
In-Reply-To: <1398789462-11177-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 29 Apr 2014 13:37:42 -0300")
References: <1398789462-11177-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ioppqire.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Switch to gcc 4.9.x for microblaze since it's a better target than
 > 4.8.x, and also add a build patch that fixes (e)glibc build issues.
 > Hence disable 4.8.x for microblaze.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
