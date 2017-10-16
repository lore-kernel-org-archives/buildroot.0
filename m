From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:53:08 +0200
Subject: [Buildroot] [PATCH] ruby: add upstream security patches bumping
	rubygems to 2.6.13
In-Reply-To: <20170907091755.9491-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Sep 2017 11:17:55 +0200")
References: <20170907091755.9491-1-peter@korsgaard.com>
Message-ID: <874lqyu5dn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > We unfortunately cannot use the upstream patches directly as they are not in
 > 'patch -p1' format, so convert them and include instead.

 > Fixes:

 > CVE-2017-0899 - RubyGems version 2.6.12 and earlier is vulnerable to
 > maliciously crafted gem specifications that include terminal escape
 > characters.  Printing the gem specification would execute terminal escape
 > sequences.

 > CVE-2017-0900 - RubyGems version 2.6.12 and earlier is vulnerable to
 > maliciously crafted gem specifications to cause a denial of service attack
 > against RubyGems clients who have issued a `query` command.

 > CVE-2017-0901 - RubyGems version 2.6.12 and earlier fails to validate
 > specification names, allowing a maliciously crafted gem to potentially
 > overwrite any file on the filesystem.

 > CVE-2017-0902 - RubyGems version 2.6.12 and earlier is vulnerable to a DNS
 > hijacking vulnerability that allows a MITM attacker to force the RubyGems
 > client to download and install gems from a server that the attacker
 > controls.

 > For more details, see
 > https://www.ruby-lang.org/en/news/2017/08/29/multiple-vulnerabilities-in-rubygems/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
