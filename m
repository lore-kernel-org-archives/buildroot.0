From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 11:54:45 +0100
Subject: [Buildroot] [PATCH] dosfstools: fix host variant dependencies
In-Reply-To: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 21 Mar 2013 09:12:34 -0300")
References: <1363867954-28937-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y5ddnk3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> host-dosfstools shouldn't pull host-libiconv in since that's for
 Gustavo> uClibc-based toolchains and we don't have that package anyway.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/7637985bfb0afdd9217c297e9b0ac5de797c137d/

Committed, thanks.

-- 
Bye, Peter Korsgaard
