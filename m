From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:23:42 +0200
Subject: [Buildroot] [PATCH 1/1] linux: allow both in-tree and custom
 dts files
In-Reply-To: <20180221195316.8496-1-simon.vanderveldt@gmail.com> (Simon van
 der Veldt's message of "Wed, 21 Feb 2018 20:53:16 +0100")
References: <20180221195316.8496-1-simon.vanderveldt@gmail.com>
Message-ID: <87zi2p4bb5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon van der Veldt <simon.vanderveldt@gmail.com> writes:

 > For some boards, for example the Raspberry Pi, it's necessary to build in-tree dts files as well
 > as custom/out of tree dts-files (dt-blob.bin).
 > The existing logic made these two options exclusive, this commit changes that to allow both
 > in-tree as well as custom sources for dts files.

 > Signed-off-by: Simon van der Veldt <simon.vanderveldt@gmail.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
