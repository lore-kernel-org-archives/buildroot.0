From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 10:13:19 +0100
Subject: [Buildroot] [PATCH] quagga: add upstream security fix for
 CVE-2017-16227
In-Reply-To: <20171030215309.21483-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 30 Oct 2017 22:53:09 +0100")
References: <20171030215309.21483-1-peter@korsgaard.com>
Message-ID: <878tetjtcg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the advisory:
 > http://www.openwall.com/lists/oss-security/2017/10/30/4

 > It was discovered that the bgpd daemon in the Quagga routing suite does
 > not properly calculate the length of multi-segment AS_PATH UPDATE
 > messages, causing bgpd to drop a session and potentially resulting in
 > loss of network connectivity.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
