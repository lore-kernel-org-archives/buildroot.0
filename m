From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 9 Apr 2017 21:32:56 +0200
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170408160959.1e0ef627@free-electrons.com>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
 <20170408160959.1e0ef627@free-electrons.com>
Message-ID: <20170409213256.3a854474@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 8 Apr 2017 16:09:59 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sat, 18 Feb 2017 12:32:02 +0100, Peter Seiderer wrote:
> > If selected use:
> > 
> >  - system/buildroot harfbuzz in case __sync for 4 bytes is supported
> >  - qt harfbuzz otherwise (using QAtomic instead)
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> We still have this patch pending. Could you summarize if it's still
> needed. From a quick read of our past discussion, it seems like it is
> still needed, but I prefer to ask before applying. Thanks!
> 

...considering your quote 'We generally don't like
to use the builtin libraries.' ([1]) I would say yes ;-)

Otherwise at least the harfbuzz license part is needed...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2017-February/183615.html

> Thomas
