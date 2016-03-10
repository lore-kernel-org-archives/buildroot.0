From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 20:52:31 +0100
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.2p2
In-Reply-To: <1457634868-4463-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Mar 2016 15:34:28 -0300")
References: <1457634868-4463-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8m6m7pc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-3115 - sanitise X11 authentication credentials to avoid xauth
 > command injection when X11Forwarding is enabled.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
