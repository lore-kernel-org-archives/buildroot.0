From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Apr 2013 09:45:20 +0200
Subject: [Buildroot] [PATCHv2] openvpn: adjust iproute2 path logic
In-Reply-To: <1365111173-29701-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Apr 2013 18:32:53 -0300")
References: <1365111173-29701-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vc7y3htb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> As reported in bug #6164 when using busybox iproute2 openvpn
 Gustavo> can fail to locate the 'ip' utility.  This was correct until
 Gustavo> busybox 1.21.0 was released since it changed the location of
 Gustavo> /bin/ip to /sbin/ip (what iproute2 proper does).  So adjust
 Gustavo> the ip path accordingly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
