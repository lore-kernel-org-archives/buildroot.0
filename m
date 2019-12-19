From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2019 14:44:30 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.14.0
In-Reply-To: <20191218125707.22211-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 18 Dec 2019 13:57:07 +0100")
References: <20191218125707.22211-1-peter@korsgaard.com>
Message-ID: <87eex02zwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities (in npm):
 > - CVE-2019-16775: Versions of the npm CLI prior to 6.13.3 are vulnerable to
 >   an Arbitrary File Write.  It is possible for packages to create symlinks
 >   to files outside of thenode_modules folder through the bin field upon
 >   installation
 >   https://www.npmjs.com/advisories/1436

 > - CVE-2019-16776: Versions of the npm CLI prior to 6.13.3 are vulnerable to
 >   an Arbitrary File Write.  It fails to prevent access to folders outside of
 >   the intended node_modules folder through the bin field
 >   https://www.npmjs.com/advisories/1434

 > - CVE-2019-16777: Versions of the npm CLI prior to 6.13.4 are vulnerable to
 >   an Arbitrary File Overwrite.  It fails to prevent existing
 >   globally-installed binaries to be overwritten by other package
 >   installations
 >   https://www.npmjs.com/advisories/1437

 > For further details, see the upstream announcements:

 > https://blog.npmjs.org/post/189618601100/binary-planting-with-the-npm-cli
 > https://nodejs.org/en/blog/vulnerability/december-2019-security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
