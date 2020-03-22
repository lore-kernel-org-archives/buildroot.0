From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Mar 2020 22:39:02 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/python-jinja2: fix runtime
 python modules dependencies
In-Reply-To: <20200322221750.26ef6f3b@windsurf.home>
References: <20200322211002.30765-1-ps.report@gmx.net>
 <20200322221750.26ef6f3b@windsurf.home>
Message-ID: <20200322223902.21b9f1e1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 22 Mar 2020 22:17:50 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 22 Mar 2020 22:10:01 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add python unicodedata runtime dependency, fixes:
> >   File "usr/lib/python3.8/site-packages/jinja2/lexer.py", line 46, in <module>
> >   ModuleNotFoundError: No module named 'unicodedata'
> > ---
> >  package/python-jinja2/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
>
> These two patches lack your Signed-off-by. Also, what about adding
> runtime tests for those two packages, to detect such missing runtime
> dependencies ?

Ups, will re-send with the Signed-off-by added...

Will take a look at the runtime tests...

Regards,
Peter

>
> Thanks!
>
> Thomas
