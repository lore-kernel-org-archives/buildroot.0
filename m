From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 08:41:58 +0100
Subject: [Buildroot] [PATCH] package/subversion: security bump to
 version 1.14.1
In-Reply-To: <20210211141838.15911-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 11 Feb 2021 15:18:37 +0100")
References: <20210211141838.15911-1-peter@korsgaard.com>
Message-ID: <87h7mhhgvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2020-17525: Remote unauthenticated denial-of-service in Subversion
 > mod_authz_svn

 > Subversion's mod_authz_svn module will crash if the server is using
 > in-repository authz rules with the AuthzSVNReposRelativeAccessFile option
 > and a client sends a request for a non-existing repository URL.

 > For more details, see the advisory:
 > https://subversion.apache.org/security/CVE-2020-17525-advisory.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
