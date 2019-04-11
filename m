From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Apr 2019 13:02:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: add upstream 2019-1, 2,
 3 security patches
In-Reply-To: <20190411104753.v363hzqtxdo6cgxn@sapphire.tkos.co.il> (Baruch
 Siach's message of "Thu, 11 Apr 2019 13:47:53 +0300")
References: <20190411104215.8317-1-peter@korsgaard.com>
 <20190411104753.v363hzqtxdo6cgxn@sapphire.tkos.co.il>
Message-ID: <87imvkreig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, Apr 11, 2019 at 12:42:13PM +0200, Peter Korsgaard wrote:
 >> Fixes the following security vulnerabilities:
 >> 
 >> - CVE-2019-9494 (cache attack against SAE)
 >> 
 >> For details, see the advisory:
 >> https://w1.fi/security/2019-1/sae-side-channel-attacks.txt
 >> 
 >> - CVE-2019-9495 (cache attack against EAP-pwd)
 >> 
 >> For details, see the advisory:
 >> https://w1.fi/security/2019-2/eap-pwd-side-channel-attack.txt
 >> 
 >> - CVE-2019-9496 (SAE confirm missing state validation in hostapd/AP)
 >> 
 >> For details, see the advisory:
 >> https://w1.fi/security/2019-3/sae-confirm-missing-state-validation.txt
 >> 
 >> Notice that SAE is not currently enabled in Buildroot, but the patches are
 >> included here anyway for completeness.

 > What about CVE-2019-949{7,8,9}?

 > https://w1.fi/security/2019-4/eap-pwd-missing-commit-validation.txt

Ups, I missed the advisory for those. I'l update and send a v2.

-- 
Bye, Peter Korsgaard
