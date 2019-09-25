From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 19:58:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/nghttp2: security bump to
 version 1.39.2
In-Reply-To: <20190912194354.27963-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Sep 2019 21:43:53 +0200")
References: <20190912194354.27963-1-peter@korsgaard.com>
Message-ID: <87wodwl0ll.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-9511: Data Dribble
 > CVE-2019-9513: Resource Loop

 > For details, see the advisory:
 > https://nghttp2.org/blog/2019/08/19/nghttp2-v1-39-2/

 > Notice that libnghttp2 itself is not affected by these vulnerabilities, only
 > nghttpx and nghttpd (which are currently not built).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
