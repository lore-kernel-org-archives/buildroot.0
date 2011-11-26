From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Nov 2011 13:10:05 +0100
Subject: [Buildroot] [PATCH] thttpd: fix build breakage with eglibc/glibc
In-Reply-To: <1322232510-630-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 25 Nov 2011 11:48:30 -0300")
References: <1322232510-630-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878vn3jd9e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix getline() function conflict with glibc/eglibc by renaming it.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
