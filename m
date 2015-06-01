From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jun 2015 23:54:50 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.5
In-Reply-To: <1433172381-19425-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 1 Jun 2015 12:26:21 -0300")
References: <1433172381-19425-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8wjumad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-3808 CVE-2015-3809 - The LBMR dissector could go into an
 > infinite loop.
 > CVE-2015-3811 - The WCP dissector could crash while decompressing data.
 > CVE-2015-3812 - The X11 dissector could leak memory.
 > CVE-2015-3813 - The packet reassembly code could leak memory.
 > CVE-2015-3814 - The IEEE 802.11 dissector could go into an infinite
 > loop.
 > CVE-2015-3815 - The Android Logcat file parser could crash.

 > Patch upstream so drop and disable autoreconf.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
