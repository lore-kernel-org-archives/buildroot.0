From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 11:35:55 +0100
Subject: [Buildroot] [PATCH] gcc: or1k: use 20170218 tag instead of
 branch
In-Reply-To: <20180205093609.GG30895@lianli.shorne-pla.net> (Stafford Horne's
 message of "Mon, 5 Feb 2018 18:36:09 +0900")
References: <20180203201821.3924-1-peter@korsgaard.com>
 <CACPK8XfD4dHS4QMDr_HdgLSoHT+PX-zJ5wxXbsjL-hN2pzDpuA@mail.gmail.com>
 <20180205093609.GG30895@lianli.shorne-pla.net>
Message-ID: <87372fwwok.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stafford" == Stafford Horne <shorne@gmail.com> writes:

Hi,

 >> Thanks, that fixes the issue for me.

 > Hello, it might have been me that broke this. (I posted new tags to github for
 > openrisc)

 > I have been working on updating the GCC port to 7.2.0 with binutils 2.29, its in
 > my forks right now:

 >   https://github.com/stffrdhrn/binutils-gdb/tree/or1k-2.29
 >   https://github.com/stffrdhrn/or1k-gcc/tree/or1k-7.2.0-20180112

 > With 7.x we no longer need a separate branch/tag for musl.

Ok, that's nice!

 > I dont know too much about the buildroot build, but let me know if you need me
 > to do anything on the openrisc github repo to make it better.

I think everything is fine now, it was really a mistake from our side /
github changing their automatic archiving logic.

Thanks for the heads up!

-- 
Bye, Peter Korsgaard
