From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 12:38:57 +0200
Subject: [Buildroot] [PATCH] guile: security bump to version 2.0.13
In-Reply-To: <1476352333-2700-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 13 Oct 2016 06:52:13 -0300")
References: <1476352333-2700-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760owjzy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-8606 - REPL server now protects against HTTP inter-protocol
 > attacks.
 > CVE-2016-8605 - 'mkdir' procedure no longer calls umask(2).

 > Remove upstream patch.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
