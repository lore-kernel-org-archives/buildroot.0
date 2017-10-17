From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:09:30 +0200
Subject: [Buildroot] [PATCH 2/2] libnss: security bump to version 3.33
In-Reply-To: <20171012211752.18036-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Oct 2017 23:17:52 +0200")
References: <20171012211752.18036-1-peter@korsgaard.com>
 <20171012211752.18036-2-peter@korsgaard.com>
Message-ID: <87tvyygmyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7805 - Martin Thomson discovered that nss, the Mozilla
 > Network Security Service library, is prone to a use-after-free vulnerability
 > in the TLS 1.2 implementation when handshake hashes are generated.  A remote
 > attacker can take advantage of this flaw to cause an application using the
 > nss library to crash, resulting in a denial of service, or potentially to
 > execute arbitrary code.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
