From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:48:42 +0200
Subject: [Buildroot] [PATCH] subversion: security bump to version 1.9.7
In-Reply-To: <20170906154039.21569-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 6 Sep 2017 17:40:39 +0200")
References: <20170906154039.21569-1-peter@korsgaard.com>
Message-ID: <87sheivk5h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-9800: Arbitrary code execution on clients through malicious
 > svn+ssh URLs in svn:externals and svn:sync-from-url

 > For more details, see
 > http://subversion.apache.org/security/CVE-2017-9800-advisory.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
