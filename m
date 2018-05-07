From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 May 2018 22:32:41 +0200
Subject: [Buildroot] [PATCH 2/5] package/stress-ng: bump version,
 fix to use system xattr header
In-Reply-To: <20180507212331.5d66b669@windsurf>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
 <e3aef063f700d64bcb91d0b139ebef0a834e85b3.1525717511.git.yann.morin.1998@free.fr>
 <20180507212331.5d66b669@windsurf>
Message-ID: <20180507203241.GG14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-07 21:23 +0200, Thomas Petazzoni spake thusly:
> On Mon,  7 May 2018 20:25:17 +0200, Yann E. MORIN wrote:
> > diff --git a/package/stress-ng/0001-xattr-from-libc.patch b/package/stress-ng/0001-xattr-from-libc.patch
> > new file mode 100644
> > index 0000000000..0064b54470
> > --- /dev/null
> > +++ b/package/stress-ng/0001-xattr-from-libc.patch
> > @@ -0,0 +1,49 @@
> > +Use system <sys/xattr.h>
> > +
> > +The one from attr is no longer installed with latest version.
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Git-formatted patch, please ?

Woops...

> Git repo is at git://kernel.ubuntu.com/cking/stress-ng.git.

I already send the patch to Colin (I hven't found a mailing list for
it).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
