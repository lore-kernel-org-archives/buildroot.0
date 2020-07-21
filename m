From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 22:24:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.5
In-Reply-To: <20200713125952.824272-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Jul 2020 14:59:52 +0200")
References: <20200713125952.824272-1-fontaine.fabrice@gmail.com>
Message-ID: <87d04omxay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-15466: It may be possible to make Wireshark consume
 > excessive CPU resources by injecting a malformed packet onto the wire or
 > by convincing someone to read a malformed packet trace file.

 > https://www.wireshark.org/security/wnpa-sec-2020-09.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
