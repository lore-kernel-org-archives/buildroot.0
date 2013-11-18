From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Nov 2013 11:40:08 +0100
Subject: [Buildroot] [PATCH] dhcp: adjust initscripts and misc details
In-Reply-To: <1384431120-28205-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 14 Nov 2013 09:12:00 -0300")
References: <1384431120-28205-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ob5ivvqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Revamp initscripts see bug #3601
 > * Trim whitespace
 > * Check for installed binary (dhcp-relay)
 > * Check for installed config (dhcp-server)
 > * Check for proper variable setup from the script (both)
 > * Add "FAIL" message when startup fails (blind OK isn't accurate)
 > * Add start/stop messages to dhcp-relay

 > Switch bool to "dhcp (ISC)" to keep in line with package sorting.

Committed, thanks.

-- 
Bye, Peter Korsgaard
