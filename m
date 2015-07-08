From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Jul 2015 23:46:29 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P1
In-Reply-To: <1436374335-28647-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Jul 2015 13:52:15 -0300")
References: <1436374335-28647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oajmmife.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-4620 - On servers configured to perform DNSSEC validation an
 > assertion failure could be triggered on answers from a specially
 > configured server.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
