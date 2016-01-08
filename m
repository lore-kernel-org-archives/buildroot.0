From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 18:52:33 +0100
Subject: [Buildroot] [PATCH] dhcpcd: security bump to version 6.10.0
In-Reply-To: <1452192214-29918-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 7 Jan 2016 15:43:34 -0300")
References: <1452192214-29918-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wprkc61q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1503 - heap overflow via malformed dhcp responses later in
 > print_option (via dhcp_envoption1) due to incorrect option length
 > values.
 > CVE-2016-1504 - invalid read/crash via malformed dhcp responses.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
