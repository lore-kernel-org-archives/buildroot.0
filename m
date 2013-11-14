From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Nov 2013 20:46:43 +0100
Subject: [Buildroot] [PATCHv2] nano: fix build breakage with libmagic
In-Reply-To: <1384448082-2678-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 14 Nov 2013 13:54:42 -0300")
References: <1384448082-2678-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uwq22cc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > As reported by Cassiano Martin in bug #6692 if host == target the nano
 > package can pick up the host libmagic and break.
 > So add a check to see if the file package is enabled and use it,
 > otherwise just disable libmagic support.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
