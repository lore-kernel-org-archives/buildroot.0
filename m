From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 21:00:15 +0100
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.4.8
In-Reply-To: <20161219195038.19344-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Mon, 19 Dec 2016 16:50:38 -0300")
References: <20161219195038.19344-1-gustavo@zacarias.com.ar>
Message-ID: <87mvfradv4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2123 - Samba NDR Parsing ndr_pull_dnsp_name Heap-based Buffer
 > Overflow Remote Code Execution Vulnerability.
 > CVE-2016-2125 - Unconditional privilege delegation to Kerberos servers
 > in trusted realms.
 > CVE-2016-2126 - Flaws in Kerberos PAC validation can trigger privilege
 > elevation.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
