From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 12 May 2016 19:03:23 +0200
Subject: [Buildroot] Is uClibc dead?
In-Reply-To: <nh26a3$g4l$1@ger.gmane.org>
References: <nh26a3$g4l$1@ger.gmane.org>
Message-ID: <20160512170323.GU26720@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,
Grant Edwards wrote,

> I recently decided to check to see what changes had been made to
> uClibc since the 4 year old version we're using in our product.  So I
> went to https://uclibc.org.
> 
> After jumping through hoops because all the SSL certificates are
> invalid/expired I see under latest news:
> 
>   15 May 2012, uClibc 0.9.33.2 Released
> 
>   uClibc-0.9.33.2 was released today. 
> 
> Odd... no releases for four years?

Yes. That was the reason for uClibc-ng.
 
> Is uClibc abandoned?

Hard to tell as the maintainer does not respond anymore.
 
> I see that buildroot now uses uclibc-ng which, according Wikipedia, is
> 
>   "a spin-off of uClibc that regularly provides a stable and tested
>    release, which is more suitable for different software development
>    processes."
> 
> So... processes different than what?

I am not sure what the wikipedia editor is meaning.

If you have a more clear description, feel free to update ;)

uClibc-ng is a try to revive uClibc. There are not many new features
or hardware platforms supported, as there is a lack of developers
and contributors. I have support for NDS32 architecture in the
queue, but I need to resolve some LTP problems first, to have some
proof that the port is working good.

If you have any questions, feel free to ask.

best regards
 Waldemar
