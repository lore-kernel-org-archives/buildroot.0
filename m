From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:22:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: add upstream 2019-5
 security patches
In-Reply-To: <20190426121522.28512-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 26 Apr 2019 14:15:21 +0200")
References: <20190426121522.28512-1-peter@korsgaard.com>
Message-ID: <87sgu3vds2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > EAP-pwd implementation in hostapd (EAP server) and wpa_supplicant (EAP
 > peer) was discovered not to validate fragmentation reassembly state
 > properly for a case where an unexpected fragment could be received. This
 > could result in process termination due to NULL pointer dereference.

 > For details, see the advisory:
 > https://w1.fi/security/2019-5/eap-pwd-message-reassembly-issue-with-unexpected-fragment.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
