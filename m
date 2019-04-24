From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:50:40 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/hostapd: add upstream 2019-1, 2, 3,
 4 security patches
In-Reply-To: <20190411111103.19705-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 11 Apr 2019 13:11:02 +0200")
References: <20190411111103.19705-1-peter@korsgaard.com>
Message-ID: <87ef5rb2sv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-9494 (cache attack against SAE)

 > For details, see the advisory:
 > https://w1.fi/security/2019-1/sae-side-channel-attacks.txt

 > - CVE-2019-9495 (cache attack against EAP-pwd)

 > For details, see the advisory:
 > https://w1.fi/security/2019-2/eap-pwd-side-channel-attack.txt

 > - CVE-2019-9496 (SAE confirm missing state validation in hostapd/AP)

 > For details, see the advisory:
 > https://w1.fi/security/2019-3/sae-confirm-missing-state-validation.txt

 > - CVE-2019-9497 (EAP-pwd server not checking for reflection attack)
 > - CVE-2019-9498 (EAP-pwd server missing commit validation for scalar/element)
 > - CVE-2019-9499 (EAP-pwd peer missing commit validation for scalar/element)

 > For details, see the advisory:
 > https://w1.fi/security/2019-4/eap-pwd-missing-commit-validation.txt

 > Notice that SAE is not currently enabled in Buildroot, but the patches are
 > included here anyway for completeness.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
