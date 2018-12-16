From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:55:44 +0100
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.11.4
In-Reply-To: <20181215155010.2033-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 15 Dec 2018 16:50:10 +0100")
References: <20181215155010.2033-1-peter@korsgaard.com>
Message-ID: <87imzt3zmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > go 1.11.3 fixes the following security issues:
 > cmd/go: remote command execution during "go get -u"
 > The issue is CVE-2018-16873 and Go issue golang.org/issue/29230. See the Go issue for details.
 > Thanks to Etienne Stalmans from the Heroku platform security team for discovering and reporting this issue.

 > cmd/go: directory traversal in "go get" via curly braces in import paths
 > The issue is CVE-2018-16874 and Go issue golang.org/issue/29231. See the Go issue for details.
 > Thanks to ztz of Tencent Security Platform for discovering and reporting this issue.

 > crypto/x509: CPU denial of service in chain validation
 > The issue is CVE-2018-16875 and Go issue golang.org/issue/29233. See the Go issue for details.
 > Thanks to Netflix for discovering and reporting this issue.

 > go 1.11.4 fixes issues, including regressions introduced by 1.11.3:

 > 1.11.4 includes fixes to cgo, the compiler, linker, runtime, documentation, go
 > command, and the net/http and go/types packages.  It includes a fix to a bug
 > introduced in Go 1.11.3 that broke go get for import path patterns
 > containing "...".

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
