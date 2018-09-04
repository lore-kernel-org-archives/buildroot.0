From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Sep 2018 23:04:01 +0200
Subject: [Buildroot] [PATCH] package/xen: disable tools/qemu-xen/ opengl
In-Reply-To: <20180904191347.13857-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Tue, 4 Sep 2018 14:13:47 -0500")
References: <20180904191347.13857-1-matthew.weber@rockwellcollins.com>
Message-ID: <87r2i9asam.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Resolves:
 > http://autobuild.buildroot.net/results/a7f2bf387458c2f0db6a4b555c51004f321f9320

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

It looks like we have a similar issue for qemu:

http://autobuild.buildroot.net/results/827/827864f987cb5e82786e0a74be831aaad4d26610/build-end.log

-- 
Bye, Peter Korsgaard
