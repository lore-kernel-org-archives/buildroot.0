From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Mar 2014 22:24:37 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-07
In-Reply-To: <87y50is15m.fsf@dell.be.48ers.dk>
References: <20140308073007.50AAF1016F2@stock.ovh.net>
 <20140308110454.GA3254@free.fr> <20140308150515.467d5568@skate>
 <531D5F01.8080106@mind.be> <87y50is15m.fsf@dell.be.48ers.dk>
Message-ID: <20140323222437.640da974@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 10 Mar 2014 13:12:21 +0100, Peter Korsgaard wrote:

>  >  Or you could add an hour to the timeout if Webkit is selected...
> 
> Does the build often get stuck? I don't recall seing it more than a few
> times on "my" builders. In my (simplistic) autobuilder script I simply
> do:

I recall adding the timeout because one particular external toolchain
had a bug in "ld" which lead to ld ending up into an infinite loop
consuming 100% of CPU time doing nothing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
