From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 May 2013 16:20:33 +0200
Subject: [Buildroot] [PATCH] curlftpfs: specify curl-config path
In-Reply-To: <1368450086-8430-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 13 May 2013 10:01:26 -0300")
References: <1368450086-8430-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2svt0zy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> curlftpfs may pick up the distribution curl-config rather than the one
 Gustavo> in the staging area thus failing to build.
 Gustavo> Fix it by hardcoding the curl-config path.

Committed, thanks.

-- 
Bye, Peter Korsgaard
