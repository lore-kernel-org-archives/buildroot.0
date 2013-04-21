From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Apr 2013 22:34:53 +0200
Subject: [Buildroot] [PATCH] quagga: fix build breakage without snmp
In-Reply-To: <1366285641-7018-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 18 Apr 2013 08:47:21 -0300")
References: <1366285641-7018-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txmzhbbm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Quagga no longer supports explicitly disabling snmp, and what's worse,
 Gustavo> it interprets --disable-snmp as --enable-snmp.
 Gustavo> Remove the disable configure option.
 Gustavo> While at it add a comment about net-snmp requiring AgentX support for
 Gustavo> quagga to build properly as suggested by Arnout.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/a9bce6dd8065ddb1850a4e14f0e4eb257ee89286/

Committed, thanks.

-- 
Bye, Peter Korsgaard
