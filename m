From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 15:31:30 +0200
Subject: [Buildroot] [PATCH 6/6] qt5base: add patch to fix gold linker
	issue
In-Reply-To: <87egmgbr7b.fsf@dell.be.48ers.dk>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431714233-24324-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <87egmgbr7b.fsf@dell.be.48ers.dk>
Message-ID: <20150516153130.2853b37f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 16 May 2015 15:13:44 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > The newly added patch makes sure that gold linker functionality is not
>  > used when doing host builds, since qt5 only tests the availability of
>  > this feature with the target compiler.
> 
>  > Fixes:
> 
>  >   http://autobuild.buildroot.net/results/f403a76ac0abbf8488373c0dffb4487f5d98c55d/
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Committed, thanks. Don't forget to send the patch upstream.

I already submitted the patch as part of a bug report, which URL is
mentioned in my Buildroot patch. However, they ask me to follow the
entire Qt contribution process for just a one line patch, which I'm not
sure I'm willing to do :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
