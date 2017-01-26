From: Lionel Flandrin <lionel@svkt.org>
Date: Thu, 26 Jan 2017 13:18:59 +0100
Subject: [Buildroot] [PATCH 1/2] python-flask: bump to version 0.12
In-Reply-To: <CAGm1_kuKj1_2rA6H6PfyxRXNSfY1ndNvGnS3VKeHTFfwb_VmGw@mail.gmail.com>
References: <20170125090150.2548-1-lionel@svkt.org>
 <CAGm1_kuKj1_2rA6H6PfyxRXNSfY1ndNvGnS3VKeHTFfwb_VmGw@mail.gmail.com>
Message-ID: <20170126121859.yo2ugmdi2r5xqbzs@ed>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 25, 2017 at 10:09:42AM +0100, Yegor Yefremov wrote:
> On Wed, Jan 25, 2017 at 10:01 AM, Lionel Flandrin <lionel@svkt.org> wrote:
> > Signed-off-by: Lionel Flandrin <lionel@svkt.org>
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Care to update jinja as well https://github.com/pallets/jinja/releases

Politely bumping this patch now that Jinja has been updated.

> Yegor
> 
> > ---
> >  package/python-flask/python-flask.hash | 4 ++--
> >  package/python-flask/python-flask.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
> > index 01ccc6e29..919b07598 100644
> > --- a/package/python-flask/python-flask.hash
> > +++ b/package/python-flask/python-flask.hash
> > @@ -1,3 +1,3 @@
> >  # md5 from https://pypi.python.org/pypi/flask/json, sha256 locally computed
> > -md5    d2af95d8fe79cf7da099f062dd122a08  Flask-0.11.1.tar.gz
> > -sha256 b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28756b0e  Flask-0.11.1.tar.gz
> > +md5    c1d30f51cff4a38f9454b23328a15c5a  Flask-0.12.tar.gz
> > +sha256 93e803cdbe326a61ebd5c5d353959397c85f829bec610d59cb635c9f97d7ca8b  Flask-0.12.tar.gz
> > diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
> > index 204eba0af..6c25a6d14 100644
> > --- a/package/python-flask/python-flask.mk
> > +++ b/package/python-flask/python-flask.mk
> > @@ -4,9 +4,9 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_FLASK_VERSION = 0.11.1
> > +PYTHON_FLASK_VERSION = 0.12
> >  PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
> > -PYTHON_FLASK_SITE = https://pypi.python.org/packages/55/8a/78e165d30f0c8bb5d57c429a30ee5749825ed461ad6c959688872643ffb3
> > +PYTHON_FLASK_SITE = https://pypi.python.org/packages/4b/3a/4c20183df155dd2e39168e35d53a388efb384a512ca6c73001d8292c094a
> >  PYTHON_FLASK_SETUP_TYPE = setuptools
> >  PYTHON_FLASK_LICENSE = BSD-3c
> >  PYTHON_FLASK_LICENSE_FILES = LICENSE
> > --
> > 2.11.0
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Lionel Flandrin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170126/d8a01be0/attachment.asc>
