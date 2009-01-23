From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 15:50:05 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <1232721038.6350.9.camel@sven>
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
	<5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	<877i4no5n7.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
	<87zlhjml3m.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABC@freja.acte.local>
	<87sknbmjj4.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABE@freja.acte.local>
	<87wscml1t2.fsf@macbook.be.48ers.dk>
	<1232715723.5311.57.camel@elrond.atmel.com>
	<1232721038.6350.9.camel@sven>
Message-ID: <1232722205.5311.66.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 15:30 +0100 skrev Sven Neumann:
> Hi,
> 
> On Fri, 2009-01-23 at 14:02 +0100, Ulf Samuelsson wrote:
> 
> > I OABI works and EABI doesn't then I am not going to drive EABI.
> > Still way too many packages that does not build...
> 
> Oh, please. EABI works nicely as long as the toolchain is correctly
> configured. And there are very good reasons to prefer EABI over OABI.
> The performance difference is definitely worth it.
> 

If it is so easy that you just need to change OABI to EABI,
then do I need to get involved?
I do not say that it is a bad idea to have EABI,
but you have to choose your battleground,
and my primary focus is ironing
out inherent issues with current packages.

Everything else has less importance to me, RIGHT NOW.

Since it is a collaborative effort, anyone
can take up the EABI ball.

BR
Ulf Samuelsson

> Sven
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
