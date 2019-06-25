From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 25 Jun 2019 04:47:48 -0500
Subject: [Buildroot] [PATCH 6/6] package/python-wsgiref: new package
In-Reply-To: <20190620222525.0f8f96dd@windsurf>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
 <20190531171654.17906-6-matthew.weber@rockwellcollins.com>
 <20190620222525.0f8f96dd@windsurf>
Message-ID: <CANQCQpbyB0=FDOQc0aL_n-bb1w8K6HtVHxeUPvpD2V1ibtW1WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Thu, Jun 20, 2019 at 3:25 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 31 May 2019 12:16:54 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > The Web Server Gateway Interface (WSGI) package defines a
> > standard interface between web server software and web
> > applications.
> >
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>

I've noted this patch as rejected in patchwork.  I found out the
actual codebase for this package is inside of the python/Lib/ [1] and
the pip version [2] was quite old.  Both python2 and 3 provide this
example library and helpers as part of the normal target install.

Thanks!


[1] https://github.com/python/cpython/tree/master/Lib/wsgiref
[2] https://pypi.org/project/wsgiref/#history
