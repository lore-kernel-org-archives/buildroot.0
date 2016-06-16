From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 16 Jun 2016 12:11:52 -0300 (BRT)
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160615215258.5e9e85a6@free-electrons.com>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160615215258.5e9e85a6@free-electrons.com>
Message-ID: <1367716386.4074651.1466089912238.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: buildroot at uclibc.org, "joerg krause" <joerg.krause@embedded.rocks>, "sylvain raybaud"
> <sylvain.raybaud@green-communications.fr>, "Angelo Compagnucci" <angelo.compagnucci@gmail.com>, "Romain Izard"
> <romain.izard.pro@gmail.com>, "Jeroen Roovers" <jer@airfi.aero>, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>,
> "Yegor Yefremov" <yegorslists@googlemail.com>, "Danomi Manchego" <danomimanchego123@gmail.com>, "Carlos Santos"
> <casantos@datacom.ind.br>, "Stewart Smith" <stewart@linux.vnet.ibm.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
> Sent: Wednesday, June 15, 2016 4:52:58 PM
> Subject: Re: [Buildroot] Patchwork cleanup, week #22

> Hello,
> 
> On Wed, 1 Jun 2016 23:26:54 +0200, Thomas Petazzoni wrote:

>>  4/ coreutils: allow selection of installed programs
>>     http://patchwork.ozlabs.org/patch/577829/
>> 
>>     There's been a lengthy discussion, but no real conclusion. Of
>>     course, we are questioning the value of having so many fine-grained
>>     Config.in options.
> 
> In agreement with the author, this one has been marked Rejected.

I was sympathetic to the idea for the same reasons why I'm interested on the change in util-linux. I did not have time to work on it, however. Perhaps I will give it a try later but for the moment let's leave coreutils in peace.

>>  8/ util-linux: rework utilities menu for finer control
>>     http://patchwork.ozlabs.org/patch/589889/
> 
> This one has already been marked as Superseded, since Carlos did a
> newer version: http://patchwork.ozlabs.org/patch/631262/.

> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Carlos Santos (Casantos)
DATACOM, P&D
