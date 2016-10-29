From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Oct 2016 16:54:33 +0200
Subject: [Buildroot] [PATCH 1/2] python-jsonschema: new package
In-Reply-To: <20161029160239.4ce7e48b@free-electrons.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
 <20161029160239.4ce7e48b@free-electrons.com>
Message-ID: <CAPi7W806jxUczm3UTKphuK6rYqwFrwXAEbo063MvQ0feSKuOow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

You're right the soletta package does not need the target variant of this
package. We could indeed keep it for other people or I can send a new
version of my patch without the target variant of python-jsonschema.

Best Regards,

Fabrice

2016-10-29 16:02 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Tue, 25 Oct 2016 20:25:34 +0200, Fabrice Fontaine wrote:
>
> > +PYTHON_JSONSCHEMA_VERSION = 2.5.1
> > +PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_
> JSONSCHEMA_VERSION).tar.gz
> > +PYTHON_JSONSCHEMA_SITE = \
> > +     https://pypi.python.org/packages/58/0d/
> c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7
> > +PYTHON_JSONSCHEMA_SETUP_TYPE = setuptools
> > +PYTHON_JSONSCHEMA_LICENSE = MIT
> > +PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING
> > +
> > +$(eval $(python-package))
> > +$(eval $(host-python-package))
>
> Is there a motivation to add the target variant of this package? Your
> patch 2/2 seems to be using only the host variant of python-jsonschema.
> Am I missing something, or are you just adding the target variant just
> because it can also be useful to other people?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161029/ba190777/attachment.html>
