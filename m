From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 29 Nov 2019 03:38:29 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-cchardet: bump to
 version 2.1.5
In-Reply-To: <875zj3c9c3.fsf@dell.be.48ers.dk>
References: <20191128222118.25491-1-james.hilliard1@gmail.com>
 <875zj3c9c3.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4pprFKQZ9gnc__qGE-0Y8cUqP9rCj-FpgCR832UbVYrgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 29, 2019 at 3:37 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  > ---
>  >  package/python-cchardet/python-cchardet.hash | 4 ++--
>  >  package/python-cchardet/python-cchardet.mk   | 4 ++--
>  >  2 files changed, 4 insertions(+), 4 deletions(-)
>
>  > diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
>  > index 231804ee3c..d023457854 100644
>  > --- a/package/python-cchardet/python-cchardet.hash
>  > +++ b/package/python-cchardet/python-cchardet.hash
>  > @@ -1,5 +1,5 @@
>  >  # md5, sha256 from https://pypi.org/pypi/cchardet/json
>  > -md5 17af20af67cb18e958854e273d857a88  cchardet-2.1.4.tar.gz
>  > -sha256      cc9745e0400da4cfb49f075e7819f22473b66443f953427058fee2c7b9547cc0  cchardet-2.1.4.tar.gz
>  > +md5 681af4e6546e47e2ae856057a8a7d105  cchardet-2.1.5.tar.gz
>  > +sha256      240efe3f255f916769458343840b9c6403cf3192720bc5129792cbcb88bf72fb  cchardet-2.1.5.tar.gz
>  >  # Locally computed sha256 checksums
>  >  sha256      107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
>  > diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
>  > index 9ac170c22d..58082538d0 100644
>  > --- a/package/python-cchardet/python-cchardet.mk
>  > +++ b/package/python-cchardet/python-cchardet.mk
>  > @@ -4,9 +4,9 @@
>  >  #
>  >  ################################################################################
>
>  > -PYTHON_CCHARDET_VERSION = 2.1.4
>  > +PYTHON_CCHARDET_VERSION = 2.1.5
>
> Is this for master or next? Looking at
probably a good idea to apply to both
> https://github.com/PyYoshi/cChardet/blob/master/CHANGES.rst it sounds
> like 2.1.4 is broken with our python3 version?
>
> --
> Bye, Peter Korsgaard
