From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:51:26 +0200
Subject: [Buildroot] [PATCH] strongswan: add upstream security patch
In-Reply-To: <20170907152655.23933-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 17:26:55 +0200")
References: <20170907152655.23933-1-peter@korsgaard.com>
Message-ID: <87y3oau5gh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-11185: The gmp plugin in strongSwan before 5.6.0 allows
 > remote attackers to cause a denial of service (NULL pointer dereference and
 > daemon crash) via a crafted RSA signature.

 > For more details, see
 > https://www.strongswan.org/blog/2017/08/14/strongswan-vulnerability-%28cve-2017-11185%29.html

 > While we're at it, add hashes for the license files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
