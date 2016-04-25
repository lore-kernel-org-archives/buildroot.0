From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Apr 2016 21:15:41 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.0.3
In-Reply-To: <1461548082-31673-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 24 Apr 2016 22:34:42 -0300")
References: <1461548082-31673-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fuu9pkiq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > WNPA-SEC-2016-19 - The NCP dissector could crash.
 > WNPA-SEC-2016-20 - TShark could crash due to a packet reassembly bug.
 > WNPA-SEC-2016-21 - The IEEE 802.11 dissector could crash.
 > WNPA-SEC-2016-22 - The PKTC dissector could crash.
 > WNPA-SEC-2016-23 - The PKTC dissector could crash.
 > WNPA-SEC-2016-24 - The IAX2 dissector could go into an infinite loop.
 > WNPA-SEC-2016-25 - Wireshark and TShark could exhaust the stack.
 > WNPA-SEC-2016-26 - The GSM CBCH dissector could crash.
 > WNPA-SEC-2016-27 - MS-WSP dissector crash.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
