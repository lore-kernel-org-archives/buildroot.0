From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:57:00 +0100
Subject: [Buildroot] [PATCH-2018.02.x] package/go: security bump to
 version 1.9.7
In-Reply-To: <20181215172200.8270-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 15 Dec 2018 18:22:00 +0100")
References: <20181215172200.8270-1-peter@korsgaard.com>
Message-ID: <87efah3zkj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > go1.9.1 (released 2017/10/04) includes two security fixes.
 > go1.9.2 (released 2017/10/25) includes fixes to the compiler, linker,
 > runtime, documentation, go command, and the crypto/x509, database/sql, log,
 > and net/smtp packages.  It includes a fix to a bug introduced in Go 1.9.1
 > that broke go get of non-Git repositories under certain conditions.

 > go1.9.3 (released 2018/01/22) includes fixes to the compiler, runtime, and
 > the database/sql, math/big, net/http, and net/url packages.

 > go1.9.4 (released 2018/02/07) includes a security fix to ?go get?.

 > go1.9.5 (released 2018/03/28) includes fixes to the compiler, go command,
 > and net/http/pprof package.

 > go1.9.6 (released 2018/05/01) includes fixes to the compiler and go command.

 > go1.9.7 (released 2018/06/05) includes fixes to the go command, and the
 > crypto/x509, and strings packages.  In particular, it adds minimal support
 > to the go command for the vgo transition.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
