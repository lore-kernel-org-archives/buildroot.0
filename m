From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 09 Dec 2014 12:53:36 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.6-P1
In-Reply-To: <1418124891-3773-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 9 Dec 2014 08:34:51 -0300")
References: <1418124891-3773-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjaxrqdb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-8500 - A flaw in delegation handling could be exploited
 > to put named into an infinite loop, in which each lookup of a name
 > server triggered additional lookups of more name servers.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
