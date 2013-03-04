From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 12:24:16 +0100
Subject: [Buildroot] [PATCH] f2fs-tools: explicitly select libuuid
In-Reply-To: <1362310127-27764-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 3 Mar 2013 08:28:47 -0300")
References: <1362310127-27764-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2vfcsrj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Explicitly select BR2_PACKAGE_UTIL_LINUX_LIBUUID. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/da5c52b658d9efc25d2c2ad3980add3a36b99ee2/

Committed, thanks.

-- 
Bye, Peter Korsgaard
