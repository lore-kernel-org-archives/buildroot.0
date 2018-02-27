From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 14:12:38 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <20180227130822.2208e02b@gmx.net> (Peter Seiderer's message of
 "Tue, 27 Feb 2018 13:08:22 +0100")
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
 <87fu5nsyrg.fsf@dell.be.48ers.dk> <20180227130822.2208e02b@gmx.net>
Message-ID: <87efl6poe1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Peter,
 > On Mon, 26 Feb 2018 13:48:03 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> 
 >> >> powerpc | binutils-2.29.1 | NOK |
 >> >> http://autobuild.buildroot.net/results/22839bca79e16fc0d76ebc0f3e5ec4a6d23e99f6
 >> >> | ORPH  
 >> 
 >> > read.c: In function 's_app_line':
 >> > read.c:2001:1: internal compiler error: Segmentation fault
 >> >  s_app_line (int appline)  
 >> 
 >> > Compiler error. It's on PowerPC, with a toolchain from 2017.11. Could
 >> > someone retry with a newer gcc, and see if it is fixed ?  
 >> 
 >> Notice that this happened on gcc67, so on the Ryzen CPU (and nowhere
 >> else), so I'm afraid the Ryzen crashes are _STILL_ not fixed. I'll stop
 >> the autobuilder again.

 > Is it a Ryzen CPU manufactured prior to week 25/2017? It is possible to
 > get an exchange CPU via RMA by AMD Customer Care, see [1] (worked for me
 > and the new delivered CPU runs stable (and after disabling PowerSaveStates
 > leading to machine-check exception)...

Thanks, but this should already be an exchanged CPU with an updated
BIOS:

https://lists.tetaneutral.net/pipermail/cfarm-users/2018-February/000252.html

:/
-- 
Bye, Peter Korsgaard
