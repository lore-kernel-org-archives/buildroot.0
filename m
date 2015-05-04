From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 May 2015 20:54:57 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: apply upstream security
	patches
In-Reply-To: <44800be10e173dbe7811c0e60dd29b729269f479.1430762680.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 4 May 2015 21:04:40 +0300")
References: <b4f58df743722b3573c4adf90495d3757aefaef0.1430762680.git.baruch@tkos.co.il>
 <44800be10e173dbe7811c0e60dd29b729269f479.1430762680.git.baruch@tkos.co.il>
Message-ID: <87wq0op3zy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This commit adds patches for three different upstream security advisories. No
 > CVE numbers stated.

 > http://w1.fi/security/2015-2/wps-upnp-http-chunked-transfer-encoding.txt
 > http://w1.fi/security/2015-3/integer-underflow-in-ap-mode-wmm-action-frame.txt
 > http://w1.fi/security/2015-4/eap-pwd-missing-payload-length-validation.txt

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
