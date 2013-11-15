From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Nov 2013 21:22:27 +0100
Subject: [Buildroot] [PATCH 4/7] opencv: add eigen dependency
In-Reply-To: <20131111233641.2a5564c5@skate>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
 <1384203613-17871-5-git-send-email-s.martin49@gmail.com>
 <20131111233641.2a5564c5@skate>
Message-ID: <CAHXCMM+yDMJsBssLz40EpryqG0V2mYUTOANLkMGwWRoESu0TRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/11 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Mon, 11 Nov 2013 22:00:10 +0100, Samuel Martin wrote:
> >  menuconfig BR2_PACKAGE_OPENCV
> >       bool "opencv"
> >       select BR2_PACKAGE_ZLIB
> > +     select BR2_PACKAGE_EIGEN
>
> Any reason to make it mandatory?
>

After checking with some opencv developers, eigen support does not bring
that much
(neither in term of features, nor perfs).

So I've rejected it.


>
> I'm sorry but I'm going to be a bit angry again. I've asked you many,
> many, many times to write more descriptive commit logs. And once again,
> several of your patches have just a one line title, with no explanation
> whatsoever about *why* you're doing the change.
>
> It would be really nice if you could review all your patches before you
> post them, and ask yourself the question: is the reason why I'm doing
> this going to be obvious for the reviewer? If the answer is even on the
> slightly unsure side, then it means you need to expand with a more
> detailed commit log, or more comments in the code.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131115/2401e6ab/attachment.html>
