From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:32:06 +0100
Subject: [Buildroot] test-pkg script can't handle captive portals. etc.
In-Reply-To: <401e8b88-6d8b-5dea-65c1-dfb0d53cf1ed@mind.be>
References: <f327db96-a9ce-800a-2419-79166eb9d019@cartelsol.com>
 <401e8b88-6d8b-5dea-65c1-dfb0d53cf1ed@mind.be>
Message-ID: <20170301213206.7f5746a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 09:46:28 +0100, Arnout Vandecappelle wrote:

>  However, I think it would be much nicer if we could just have the toolchain
> defconfigs inside of Buildroot instead of using this CSV file.

This would actually also solve the problem of having the autobuilders
test master/next/lts branches, since the toolchain defconfigs to test
would be part of Buildroot, and not part of buildroot-test.

There is still the problem of all the special "exclusions" encoded in
the autobuild-run script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
