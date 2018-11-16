From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 22:34:06 +0100
Subject: [Buildroot] [PATCH v1] libv4l: bump version to 1.16.2
In-Reply-To: <20181114203633.14508-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Wed, 14 Nov 2018 21:36:33 +0100")
References: <20181114203633.14508-1-ps.report@gmx.net>
Message-ID: <87wopcr9kh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - changes since 1.16.1
 >   0f68a3f6 configure: build without BPF support in ir-keytable
 >   5f8bd4e8 keytable: fix compilation warning
 >   f735bee7 keytable: fix BPF protocol compilation on mips
 >   c393c3bc Prepare for 1.16.2 release

 > - use new '--disable-bpf' option instead of ac_cv_prog_CLANG
 >   to disable BPF support, fixes [1]:

 >   bpf.c:48:4: error: #error __NR_bpf not defined. libbpf does not support your arch.

 > - remove upstream denied patch (see [2]) fixing part of the BPF support
 >   for older toolchains

 > [1] http://autobuild.buildroot.net/results/32b8f63e84616f91b645230e889eb1518972a398
 > [2] https://www.spinics.net/lists/linux-media/msg142729.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
