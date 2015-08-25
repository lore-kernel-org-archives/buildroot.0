From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Aug 2015 22:55:44 +0200
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.1p1
In-Reply-To: <1440528839-20096-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 25 Aug 2015 15:53:59 -0300")
References: <1440528839-20096-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mvxfxf3j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-6563 - Fixed a privilege separation weakness related to PAM
 > support.
 > CVE-2015-6564 - Fixed a use-after-free bug related to PAM support that
 > was reachable by attackers who could compromise the pre-authentication
 > process for remote code exectuion.
 > CVE-2015-6565 - incorrectly set TTYs to be world-writable.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
