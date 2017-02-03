From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Feb 2017 20:58:41 +0100
Subject: [Buildroot] [PATCH] uclibc: enable mips{32,64}r6 support
In-Reply-To: <20170203141658.GA9200@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 3 Feb 2017 15:16:58 +0100")
References: <20170203141658.GA9200@waldemar-brodkorb.de>
Message-ID: <87efzf11xq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The config for ISA choice is removed for a long time as
 > the buildsystem does not pass -march=mips* to the compiler anymore.
 > For mips{32,64}r6 support NAN selection is required.

 > Tested with qemu mips32/mips64 defconfigs.

 > A small patch is required. Bug found while testing qemu defconfigs.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
