From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 11:13:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.8
In-Reply-To: <20201031233227.1682264-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Nov 2020 00:32:27 +0100")
References: <20201031233227.1682264-1-fontaine.fabrice@gmail.com>
Message-ID: <877dr292a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-26575: In Wireshark through 3.2.7, the Facebook Zero
 >   Protocol (aka FBZERO) dissector could enter an infinite loop. This was
 >   addressed in epan/dissectors/packet-fbzero.c by correcting the
 >   implementation of offset advancement.
 >   https://www.wireshark.org/security/wnpa-sec-2020-14.html
 > - Fix GQUIC dissector crash:
 >   https://www.wireshark.org/security/wnpa-sec-2020-15.html

 > https://www.wireshark.org/docs/relnotes/wireshark-3.2.8.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
