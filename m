From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:20:20 +0200
Subject: [Buildroot] [PATCH] librtlsdr: disable shared library target
In-Reply-To: <CAHXCMMJjZ3BmockfvRQaWJeccOG_+Zth=ewTK7WWQz-A_5HXyQ@mail.gmail.com>
References: <1411561915-3225-1-git-send-email-yuvaraj.patil@wipro.com>
 <20140924153333.2f56b768@free-electrons.com>
 <CAHXCMMJjZ3BmockfvRQaWJeccOG_+Zth=ewTK7WWQz-A_5HXyQ@mail.gmail.com>
Message-ID: <20141001192020.71ec3c36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 28 Sep 2014 13:51:25 +0200, Samuel Martin wrote:

> > Thanks, but we already have a patch fixing the same issue in our patch
> > queue, see http://patchwork.ozlabs.org/patch/384567/. Apparently, the
> > patch is causing some issues.
> >
> > Samuel, what is your plan regarding librtlsdr static link issue?
> 
> The patch added with this pathc is similar to the 2nd patch added in
> http://patchwork.ozlabs.org/patch/384567/.
> 
> In http://patchwork.ozlabs.org/patch/384567/, the first patch is
> causing some issue.
> After checking the libusb dependencies, this first patch is not needed
> in the context of Buildroot because when BR2_PREFER_STATIC_LIBS=y,
> libusb won't depend on any library.
> 
> IMO, this patch can be merged as is, and
> http://patchwork.ozlabs.org/patch/384567/ can be marked as superseded.

Thanks for the explanation. Next time, could you add your
formal Reviewed-by, Acked-by or Tested-by?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
