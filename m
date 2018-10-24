From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:59:42 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.17
In-Reply-To: <20181014195559.5389-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 14 Oct 2018 21:55:59 +0200")
References: <20181014195559.5389-1-peter@korsgaard.com>
Message-ID: <87a7n3bln5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16058: Bluetooth AVDTP dissector crash:
 > https://www.wireshark.org/security/wnpa-sec-2018-44.html

 > CVE-2018-16056: Bluetooth Attribute Protocol dissector crash:
 > https://www.wireshark.org/security/wnpa-sec-2018-45.html

 > CVE-2018-16057: Radiotap dissector crash:
 > https://www.wireshark.org/security/wnpa-sec-2018-46.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
