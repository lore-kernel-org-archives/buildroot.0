From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jan 2016 18:31:16 +0100
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p5
In-Reply-To: <1452251355-10986-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 8 Jan 2016 08:09:15 -0300")
References: <1452251355-10986-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874meof063.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-5300 - MITM attacker can force ntpd to make a step larger than
 > the panic threshold.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
