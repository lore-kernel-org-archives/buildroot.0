From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Oct 2019 18:01:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pathpy: bump to version
 12.0.1
In-Reply-To: <8736fphn9v.fsf@dell.be.48ers.dk>
References: <20191018182628.15545-1-asafka7@gmail.com>
 <20191018182628.15545-6-asafka7@gmail.com>
 <8736fphn9v.fsf@dell.be.48ers.dk>
Message-ID: <CALFsTFX=+Y57kSHyVRpP=41Hv8cFoNGR0PXTka4K=dANPiPKQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 19, 2019 at 3:46 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
>
>  > * Add license file (and hash).
>  > * Support for Python 2 has dropped.
>
>  > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>  > ---
>  >  package/python-pathpy/Config.in          | 1 +
>  >  package/python-pathpy/python-pathpy.hash | 8 +++++---
>  >  package/python-pathpy/python-pathpy.mk   | 5 +++--
>  >  3 files changed, 9 insertions(+), 5 deletions(-)
>
>  > diff --git a/package/python-pathpy/Config.in b/package/python-pathpy/Config.in
>  > index 98c05126bf..7c7ffc9e92 100644
>  > --- a/package/python-pathpy/Config.in
>  > +++ b/package/python-pathpy/Config.in
>  > @@ -1,5 +1,6 @@
>  >  config BR2_PACKAGE_PYTHON_PATHPY
>  >      bool "python-pathpy"
>  > +    depends on BR2_PACKAGE_PYTHON3
>
> What then about the reverse dependencies? E.G. python-pytablereader?

You're right, I must have missed that with all the other bumps...
Sent a v2, thanks!

>
> --
> Bye, Peter Korsgaard

Regards,
Asaf
