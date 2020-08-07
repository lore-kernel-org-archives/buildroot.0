From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 10:26:04 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 daily results for 2020-08-06
In-Reply-To: <DM6PR12MB33392CC36B01D767D8612F3AA1490@DM6PR12MB3339.namprd12.prod.outlook.com>
References: <32n7dphgns-1@m0098571.ppops.net>
 <DM6PR12MB33392CC36B01D767D8612F3AA1490@DM6PR12MB3339.namprd12.prod.outlook.com>
Message-ID: <20200807102604.0b7910b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 7 Aug 2020 08:12:03 +0000
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> This is just to let you know we'll be fixing GDB building sometime soon (hopefully next week).
> 
> Basically that's a problem with gdbserver building which in arc-2020.03
> (where GDB is apparently of version pre-10.0) due to upstream change in GDB 10.0 was moved to the top-level,
> see https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=919adfe8409211c726c1d05b47ca59890ee648f1.

I haven't looked at the build issue, but if arc-2020.03 gdb's version
is quite new, perhaps it needs to be built out of tree, like gdb 9.2
needs, as implemented by Romain in:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200805140337.427704-1-romain.naour at gmail.com/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
