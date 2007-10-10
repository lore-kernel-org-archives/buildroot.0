From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Wed, 10 Oct 2007 11:52:54 +0900
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <20071009213155.GU20951@aon.at>
References: <470ADDA8.3080105@ruby.dti.ne.jp>
	<20071009070816.GP20951@aon.at>	<470B5043.5010606@ruby.dti.ne.jp>
	<20071009122700.GB15786@aon.at>	<470B88CC.9040705@ruby.dti.ne.jp>	<470BD383.4060504@the-hug.org>
	<20071009193325.GR20951@aon.at>	<470BD9AB.2020909@the-hug.org>
	<470BEB08.3060209@the-hug.org> <20071009213155.GU20951@aon.at>
Message-ID: <470C3E86.5080100@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
>> I've hacked target/Config.in.arch to what I _think_ it should perhaps look 
>> like, and attached it.
> 
> Look quite similar to what i currently have, yes.

Gave a try, but failed at GCC configuration.

checking whether getrlimit is declared... yes
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
Unknown ABI used in --with-abi=o32
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory `/home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1-initial'
make: *** [/home/skuribay/devel/buildroot/toolchain_build_mips/gcc-4.2.1-initial/.compiled] Error 2
skuribay at debian:~/devel/buildroot$ 

thanks,

    Shinya Kuribayashi
