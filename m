From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Mar 2012 16:29:45 +0100
Subject: [Buildroot] [PATCH] imagemagick: Ignore host's xml2-config
In-Reply-To: <4F5F59B6.7000002@imgtec.com> (Markos Chandras's message of "Tue, 
 13 Mar 2012 14:29:10 +0000")
References: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
 <877gyoli9n.fsf@macbook.be.48ers.dk> <4F5F544B.4000601@imgtec.com>
 <4F5F56AD.2020408@imgtec.com> <4F5F59B6.7000002@imgtec.com>
Message-ID: <87399cldsm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <Markos.Chandras@imgtec.com> writes:

Hi,

 Markos> Yes, for whatever reason the buildroot infrastructure ignored
 Markos> that patch and never got applied. I guess my tree was broken
 Markos> somehow. Apologies for the noise. Please ignore my patch.

The patch logic is somewhat complicated (and we're cleaning it up) - If
any patches match <package>-<version>-*.patch, then all other patches
are ignored.

-- 
Bye, Peter Korsgaard
