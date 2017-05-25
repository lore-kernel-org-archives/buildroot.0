From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:58:45 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03
 release
In-Reply-To: <1495719401.3673.4.camel@synopsys.com>
References: <20170523184137.48708-1-abrodkin@synopsys.com>
 <20170525152739.364680be@free-electrons.com>
 <1495719401.3673.4.camel@synopsys.com>
Message-ID: <20170525155845.7bd549e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 13:36:42 +0000, Alexey Brodkin wrote:

> That's well understood indeed.
> But that was the whole point of keeping up with RCs of ARC tools in
> Buildroot's RCs so we can finally bump to the release.
> 
> Just for the record below are changes in between rc2 and final release.
> 
> GCC:
> e406b240f26e - [FIX] Typo (10 days ago) <claziss>
> 139fed9d29ab - [FIX] PIC: return false for any PIC related??unspecs (10 days ago) <Claudiu Zissulescu>
> fd593a115f30 - Revert "Changed filename for the expected dynamic loader for glibc." (2 weeks ago) <Vineet Gupta>
> 566195a06808 - Small fix to unwinding in ARC700. (2 weeks ago) <Cupertino Miranda>
> 7d380d8350a6 - [ARC] Update sleep builtin. (2 weeks ago) <claziss>
> 
> Binutils:
> bf4076d02bdd - [FIX] revert jli: don't check for argument alignment (7 days ago) <claziss>
> 7ed115c021fb - [ARC] Update MAX_INSN_FLGS. (7 days ago) <claziss>
> ed389633c649 - [ARC] Reformat error messages. (7 days ago) <claziss>
> f27d6d99f566 - [ARC] Add ldi_base and ei_base aux regs (13 days ago) <claziss>
> e02bf1fe7f06 - [JLI][FIX] Add test ld/testsuite/ld-arc/jli-overflow. Correct jli reloc (13 days ago) <claziss>
> 
> Hopefully these fixes won't cause more pain :)

OK, thanks for the details!

I have rebuilt and deployed the pre-built ARC toolchain.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
