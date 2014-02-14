From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 16:19:23 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <87k3cxn4c7.fsf@dell.be.48ers.dk>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
 <20140214151350.54cb66c5@skate> <87k3cxn4c7.fsf@dell.be.48ers.dk>
Message-ID: <20140214161923.09e10c0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 14 Feb 2014 15:42:16 +0100, Peter Korsgaard wrote:

>  > Argh. So libxml2 doesn't build at all on master. This is pretty
>  > annoying, because this package has a fairly large number of reverse
>  > dependencies, so marking all of them "depends on !BR2_arc" to avoid
>  > build problems occurring on master is going to be annoying.
> 
>  > I was discussing this morning with better whether he should have merged
> 
> s/better/Peter/ ;)

Oops, sorry!

Fortunately I have this automatic thing "Dear <foo>", which gets your
name right whenever I reply to you :-)

>  > your ARC toolchain components bump to master instead of next. He merged
>  > in next to be on the safe side, but the consequence is that we have a
>  > good number of packages that don't build for ARC in master, causing
>  > autobuilder failures, that we know are solved in next.
> 
>  > Oh well, I guess it's just a matter of waiting for the release at the
>  > end of the month, and get next merged into master.
> 
> As I said on IRC, if we think arc will be in a better state with those
> bumps cherry picked to master instead, then that's fine for me as well.

Anton, what is your confidence with this bump of the toolchain
components? Should we merge it for 2014.02 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
