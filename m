From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:49:47 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.15
In-Reply-To: <20180604215910.0158d37f@windsurf> (Thomas Petazzoni's message of
 "Mon, 4 Jun 2018 21:59:10 +0200")
References: <20180603213100.1635-1-peter@korsgaard.com>
 <20180604215910.0158d37f@windsurf>
Message-ID: <87muvtqup0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Sun,  3 Jun 2018 23:31:00 +0200, Peter Korsgaard wrote:
 >> Fixes the following security issues:
 >> 
 >> CVE-2018-11362: LDSS dissector crash
 >> https://www.wireshark.org/security/wnpa-sec-2018-25.html
 >> 
 >> CVE-2018-11357: Multiple dissectors could consume excessive memory
 >> https://www.wireshark.org/security/wnpa-sec-2018-28.html
 >> 
 >> CVE-2018-11356: DNS dissector crash
 >> https://www.wireshark.org/security/wnpa-sec-2018-29.html
 >> 
 >> CVE-2018-11360: GSM A DTAP dissector crash
 >> https://www.wireshark.org/security/wnpa-sec-2018-30.html
 >> 
 >> CVE-2018-11358: Q.931 dissector crash
 >> https://www.wireshark.org/security/wnpa-sec-2018-31.html
 >> 
 >> CVE-2018-11359: Multiple dissectors could crash
 >> https://www.wireshark.org/security/wnpa-sec-2018-33.html
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/wireshark/wireshark.hash | 4 ++--
 >> package/wireshark/wireshark.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
