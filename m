From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 23:38:07 +0100
Subject: [Buildroot] [PATCH] riemann-c-client: fix build on bfin
In-Reply-To: <20170131092025.19080-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 31 Jan 2017 10:20:25 +0100")
References: <20170131092025.19080-1-peter@korsgaard.com>
Message-ID: <87bmumrh2o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/8de/8de7e533fed3c48fdbe164bc9286148e63494c8f/build-end.log
 > http://autobuild.buildroot.net/results/828/828a4e09cb14c33b021bd347394104ff8b6dba78/build-end.log
 > http://autobuild.buildroot.net/results/fc8/fc80326880fb19cd6fbd6c0073916373a52ef873/build-end.log

 > LD symbol versioning is not working on blackfin even though ld accepts the
 > --version-script argument, causing link errors, so disable it.

 > Notice: These autobuilder issues happened with an external fdpic toolchain,
 > but the issue also occurs with internal toolchain / binutils 2.27 and
 > fdpic/flat.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
