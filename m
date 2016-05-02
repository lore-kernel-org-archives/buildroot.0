From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 May 2016 17:19:33 +0200
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p7
In-Reply-To: <1462191682-23465-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 May 2016 09:21:22 -0300")
References: <1462191682-23465-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mvo8qygq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1551 - Refclock impersonation vulnerability, AKA:
 > refclock-peering

 > CVE-2016-1549 - Sybil vulnerability: ephemeral association attack, AKA:
 > ntp-sybil - MITIGATION ONLY

 > CVE-2016-2516 - Duplicate IPs on unconfig directives will cause an
 > assertion botch

 > CVE-2016-2517 - Remote configuration trustedkey/requestkey values are not
 > properly validated

 > CVE-2016-2518 - Crafted addpeer with hmode > 7 causes array wraparound
 > with MATCH_ASSOC

 > CVE-2016-2519 - ctl_getitem() return value not always checked

 > CVE-2016-1547 - Validate crypto-NAKs, AKA: nak-dos

 > CVE-2016-1548 - Interleave-pivot - MITIGATION ONLY

 > CVE-2015-7704 - KoD fix: peer associations were broken by the fix for
 > NtpBug2901, AKA: Symmetric active/passive mode is broken

 > CVE-2015-8138 - Zero Origin Timestamp Bypass, AKA: Additional KoD Checks

 > CVE-2016-1550 - Improve NTP security against buffer comparison timing
 > attacks, authdecrypt-timing, AKA: authdecrypt-timing

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
