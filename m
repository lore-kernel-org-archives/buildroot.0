From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 19:39:41 +0100
Subject: [Buildroot] [PATCH] mono: only available for x86/x86-64 host
 architectures
In-Reply-To: <20180302074929.21404-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Mar 2018 08:49:29 +0100")
References: <20180302074929.21404-1-peter@korsgaard.com>
Message-ID: <87inaecoeq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/3cab7b54390feb5f952407f1e7fa49b9633a5f76/
 > http://autobuild.buildroot.net/results/ad9fc1f8a598d2c1ee7e6f8884f897f7b8bbb657/

 > And many others.

 > Mono needs host-mono, which fails to build on the ppc64le autobuilder.
 > There is unlikely to be any real use cases of people building mono on !x86,
 > so only make it available on x86/x86-64 hosts, similar to how it was
 > recently done for erlang.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
