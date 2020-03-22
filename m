From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Mar 2020 22:37:14 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/python-flask: fix runtime
 python modules dependencies
In-Reply-To: <20200322221811.0779c169@windsurf.home>
References: <20200322211002.30765-1-ps.report@gmx.net>
 <20200322211002.30765-2-ps.report@gmx.net>
 <20200322221811.0779c169@windsurf.home>
Message-ID: <20200322223714.646434eb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 22 Mar 2020 22:18:11 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 22 Mar 2020 22:10:02 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add python setuptools runtime dependency, fixes:
> >   ModuleNotFoundError: No module named 'pkg_resources'
> >
> > - add python libxml2 runtime dependency, fixes:
> >   ModuleNotFoundError: No module named 'xml'
> >
> > - add python ssl runtime dependency, fixes:
> >   AttributeError: 'NoneType' object has no attribute 'SSLContext'
>
> Are all these dependencies intentionally mandatory, or are they
> mandatory "by mistake" ?

No python expert - from my side intentionally mandatory, started
with a minimal defconfig only selected python3/python-flask and
added packages until I got a error free invocation of flask for
an hello world example...

Regards,
Peter

>
> Thomas
