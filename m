From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 18:10:01 +0100
Subject: [Buildroot] [PATCH] package/libssh: security bump to version
 0.9.3
In-Reply-To: <20191219080151.14616-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 19 Dec 2019 09:01:50 +0100")
References: <20191219080151.14616-1-peter@korsgaard.com>
Message-ID: <87woaks55i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-14889: Unsanitized location in scp could lead to unwanted command
 >   execution.

 > And adds various hardening improvements.  For details, see the announcement:

 > https://www.libssh.org/2019/12/10/libssh-0-9-3-and-libssh-0-8-8-security-release/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
