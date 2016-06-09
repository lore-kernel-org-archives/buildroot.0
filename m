From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 9 Jun 2016 23:30:05 +0200
Subject: [Buildroot] [PATCH v2] zeromq: fix sparc32 compile
In-Reply-To: <20160607234859.40755b4e@free-electrons.com>
References: <20160604114232.GA11109@waldemar-brodkorb.de>
 <20160607234859.40755b4e@free-electrons.com>
Message-ID: <20160609213005.GU6825@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, 4 Jun 2016 13:42:33 +0200, Waldemar Brodkorb wrote:
> > Code is otherwise compiled with sparcv9 optimization and
> > cannot be run on sparc32 (sparcv8) machine.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> > ---
> > v1 -> v2:
> >   - add git formatted patch requested by Thomas Petazzoni
> > ---
> >  .../zeromq/0003-allow-to-build-sparc-v8-leon.patch |   30 ++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 package/zeromq/0003-allow-to-build-sparc-v8-leon.patch
> 
> Applied to master, thanks. Please submit the patch upstream if not
> already done (IIRC the zeromq developers use Github, some submitting
> upstream is trivial).

Yeah, it is already done and accepted upstream,
 best regards
  Waldemar
