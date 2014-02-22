From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 21:27:35 +0100
Subject: [Buildroot] [PATCH] distcc: deprecate package,
	only useful for development
In-Reply-To: <877g8muc71.fsf@dell.be.48ers.dk>
References: <1393093797-12770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <877g8muc71.fsf@dell.be.48ers.dk>
Message-ID: <20140222212735.721e8cf3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 22 Feb 2014 21:25:38 +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Since quite a while, we have deprecated, and then removed the support
>  > to build a compiler on the target. Therefore, having a distcc package
>  > for the package is quite useless, and this patch consequently marks it
>  > as deprecated so it can be removed in a future version of Buildroot.
> 
>  > Fixes:
> 
>  >   http://autobuild.buildroot.net/results/16b/16be2138c8e5ba785fa2ad55b478dcd1b6fb5123/
> 
> It doesn't really fix the error, but ok.

Right, but is it worth fixing build issues for packages that are
completely useless? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
