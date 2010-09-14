From: Mitch Davis <mjd+buildroot@afork.com>
Date: Tue, 14 Sep 2010 14:09:49 +1000
Subject: [Buildroot] Build error "cannot find -lc"
In-Reply-To: <87d3sh7359.fsf@macbook.be.48ers.dk>
References: <KAW101-W9A50593711791769ABB3C9B740@phx.gbl>
	<20100911105201.176d1396@surf>
	<KAW101-W3400321E421A55939E3C979B750@phx.gbl>
	<KAW101-W44BEAE1114E33C6DD47BD39B770@phx.gbl>
	<20100913194702.51831574@surf> <87d3sh7359.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimH+esZGQRhRHTPuNb5aVLToQx8aNrdWLYgGWE0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 14, 2010 at 7:19 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  Thomas> Hello,
>  Thomas> On Tue, 14 Sep 2010 02:37:22 +0900
>  Thomas> S W <sw18@hotmail.co.jp> wrote:
>
>  >> I checked the /lib and /usr/lib, but I couldn't find
>  >> glibc.a file.
>  >> So I did "yum install glibc-static" to install the libc.a file.
>  >> Now it is OK with this problem.
>
>  Thomas> Ok, thanks.
>
>  Thomas> Peter, what can we do about this ? Should we enforce the fact that
>  Thomas> glibc-static is installed globally ? Or just if host-module-init-tools
>  Thomas> is going to be compiled ?
>
> Globally I would say. host-module-init-tools probably isn't the only
> package that might want to link something statically.

I'm still confused as to why a host-side app should need to be static linked...

I would rather not install glibc.a on my host...

Mitch.
