From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 14 Jan 2010 12:26:01 -0000
Subject: [Buildroot] Using gcc after builing
In-Reply-To: <001501ca9510$d4abba80$7e032f80$@com>
References: <001501ca9510$d4abba80$7e032f80$@com>
Message-ID: <43758337C78F41CA9E8C64460C150FEF@AP366>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net]
> On Behalf Of Barry Bridges
> Sent: 14 January 2010 11:58
> To: buildroot at busybox.net
> Subject: [Buildroot] Using gcc after builing
> 
> Hi all,
> 
> Sorry in advance for being a bit of a nube here, just finding my feet.
> 
> I have make my build for my arm AT91SAM9263ek without a problem. Many
> thanks to the guys who put all the effort in here to make it so much
> easier to build these things.
> 
> Anyway, i now want to compile my application for the board. Buildroot
> makes the 'correct' version if cross compiler for the device/platform.
> Should i be using this for my application.
> 

Yes.

> If so how do i access it\install it.

See the Buildroot documentation for either the latest stable release 2009.11
or GIT head http://buildroot.uclibc.org/docs.html .
This has some info on using the toolchain built by Buildroot, e.g.
http://buildroot.uclibc.org/downloads/buildroot.html#using_toolchain .

> 
> If not, what should i use and any ideas where is get if from?
> 
> 
> 
> Many thanks
> 
> 
> 
> Barry
