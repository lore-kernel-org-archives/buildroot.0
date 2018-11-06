From: Daniel Fahlgren <daniel@fahlgren.se>
Date: Tue, 06 Nov 2018 15:04:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-posix-ipc: enable also
 for python3
In-Reply-To: <CAGm1_ktQC_sdyj=XDTy=ND1yDU9NSme_7DGwLR8FNk+hoiEpQw@mail.gmail.com>
References: <20181106121459.24903-1-daniel@fahlgren.se>
 <CAGm1_ktQC_sdyj=XDTy=ND1yDU9NSme_7DGwLR8FNk+hoiEpQw@mail.gmail.com>
Message-ID: <1541513099.5597.7.camel@fahlgren.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2018-11-06 at 13:49 +0100, Yegor Yefremov wrote:
> On Tue, Nov 6, 2018 at 1:42 PM Daniel Fahlgren <daniel@fahlgren.se>
> wrote:
> > 
> > The python-posix-ipc package can be used both with python2 and
> > python3.
> > 
> > Signed-off-by: Daniel Fahlgren <daniel@fahlgren.se>
> > ---
> >  package/python-posix-ipc/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/python-posix-ipc/Config.in b/package/python-
> > posix-ipc/Config.in
> > index eba36edd7b..1f588577f5 100644
> > --- a/package/python-posix-ipc/Config.in
> > +++ b/package/python-posix-ipc/Config.in
> > @@ -1,6 +1,6 @@
> >  config BR2_PACKAGE_PYTHON_POSIX_IPC
> >         bool "python-posix-ipc"
> > -       depends on BR2_PACKAGE_PYTHON
> 
> just remove this depends line. Python package are enabled for both
> Python2 and 3 by default.

Thank you for the review, I did not know that was the case. Will send a
new version of the patch.

Best regards,
Daniel Fahlgren
