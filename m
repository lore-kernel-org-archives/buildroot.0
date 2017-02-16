From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Feb 2017 21:21:19 +0100
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.10.16
In-Reply-To: <20170216183846.14328-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Feb 2017 19:38:46 +0100")
References: <20170216183846.14328-1-peter@korsgaard.com>
Message-ID: <87vas9ga4g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From http://www.openwall.com/lists/oss-security/2017/02/16/4
 > The latest dbus release 1.10.16 fixes two symlink attacks in
 > non-production-suitable configurations. I am treating these as bugs
 > rather than practical vulnerabilities, and very much hope neither of
 > these is going to affect any real users, but I'm reporting them to
 > oss-security in case there's an attack vector that I've missed.

 > No CVEs assigned so far.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
