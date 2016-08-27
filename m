From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 09:59:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-08-23
In-Reply-To: <1472255022.3670.11.camel@embedded.rocks>
References: <20160824172543.36D1D10CEEE@stock.ovh.net>
 <1472255022.3670.11.camel@embedded.rocks>
Message-ID: <20160827095926.4449791d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Vicente, there's a question for you below :-)

Thanks!

On Sat, 27 Aug 2016 01:43:42 +0200, J?rg Krause wrote:

> On Mi, 2016-08-24 at 19:25 +0200, Thomas Petazzoni wrote:
> > Hello,
> > 
> > This is the list of Buildroot build failures that occured on
> > 2016-08-23, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches
> > to
> > fix them. Thanks!
> > 
> > Build failures related to your packages:
> > 
> > ??????mipsel |????????????????????luvi-v2.7.5 | http://autobuild.buil
> > droot.net/results/8e001112b1678f9fb1c198c84184cd6f5fc3d004
> >   
> 
> Incompatible object files:
> 
> file luvi-v2.7.5/jitted_tmp/src/lua/init.lua_luvi_generated.o: ELF 32-
> bit LSB relocatable, MIPS, MIPS32 version 1 (SYSV), not stripped
> 
> luvi-v2.7.5/CMakeFiles/luvi.dir/src/main.c.o: ELF 32-bit LSB
> relocatable, MIPS, MIPS32 rel6 version 1 (SYSV), not stripped
> 
> I'm not sure if LuaJIT is able to output object files for MIPS32R6, so
> I asked on the LuaJIT mailing list [1]. If not, we have to exclude the
> MIPS32R6 architecture from LuaJIT arch support, right?
> 
> [1]?http://www.freelists.org/post/luajit/Support-for-MIPS32r6

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
