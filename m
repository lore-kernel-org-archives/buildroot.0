From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Dec 2017 23:43:59 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.11
In-Reply-To: <20171209140837.3098-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 9 Dec 2017 15:08:37 +0100")
References: <20171209140837.3098-1-peter@korsgaard.com>
Message-ID: <87bmiilbgw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > wnpa-sec-2017-47: The IWARP_MPA dissector could crash. (Bug 14236)

 > https://www.wireshark.org/security/wnpa-sec-2017-47.html

 > wnpa-sec-2017-48: The NetBIOS dissector could crash. (Bug 14249)

 > https://www.wireshark.org/security/wnpa-sec-2017-48.html

 > wnpa-sec-2017-49: The CIP Safety dissector could crash. (Bug 14250)

 > https://www.wireshark.org/security/wnpa-sec-2017-49.html

 > For more information, see the release notes:
 > https://www.wireshark.org/docs/relnotes/wireshark-2.2.11.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/wireshark/wireshark.hash | 4 ++--
 >  package/wireshark/wireshark.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
