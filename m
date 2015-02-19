From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:28:03 +0100
Subject: [Buildroot] [PATCH 0/3] Minor pkg-rebar updates
In-Reply-To: <873862x3mm.fsf@dell.be.48ers.dk>
References: <1424106030-16836-1-git-send-email-fhunleth@troodon-software.com>
 <873862x3mm.fsf@dell.be.48ers.dk>
Message-ID: <20150219222803.4c124440@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 18 Feb 2015 23:21:21 +0100, Peter Korsgaard wrote:
> >>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:
> 
>  > I've been trying out the new rebar infrastructure with a few Erlang
>  > packages. Those packages aren't ready to contribute, but I ran into
>  > a few minor issues with the infrastructure that hopefully can make
>  > it into 2015.02.
> 
>  > Frank Hunleth (3):
>  >   pkg-rebar: HOST_CC -> HOSTCC
>  >   pkg-rebar: add bin to list of install directories
>  >   pkg-rebar: fix very minor typos in the comments
> 
> Committed series, thanks.

It seems you only applied the first two patches: the last patch was
neither pushed, and was still there in patchwork. So I applied it to
master, and pushed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
