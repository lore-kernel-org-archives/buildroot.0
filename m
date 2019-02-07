From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 7 Feb 2019 10:06:57 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-02-06 (m68k openssl1.1.x failure)
In-Reply-To: <20190207070043.3896460D38@crulimr01.rockwellcollins.com>
References: <20190207070043.3896460D38@crulimr01.rockwellcollins.com>
Message-ID: <CANQCQpYwYqhA0DW9EoaSsfzegEqOsgdacdzics2dtCahD6zzPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Feb 7, 2019 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2019-02-06, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>         m68k |              libopenssl-1.1.1a | http://autobuild.buildroot.net/results/39e5911dd0b3f173965ad38b16fc6059780e1bfd

BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2018.05.tar.bz2"
    GCC6
    Binutils 2.29.1 or 2.30 (didn't specifically check yet)
    UCLIBC
    Linux 4.16 headers


/tmp/ccndwfFs.s: Assembler messages:
/tmp/ccndwfFs.s:11167: Error: value -32790 out of range
Makefile:1603: recipe for target 'crypto/blake2/blake2b.o' failed
make[2]: *** [crypto/blake2/blake2b.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
'/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-5/output/build/libopenssl-1.1.1a'


Waldemar / Yann / Thomas, have we seen one like this before with m68k?
