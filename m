From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 15 Sep 2014 14:06:43 +0000
Subject: [Buildroot] [PATCH] ARC: gcc - Fix SIZE_TYPE to be "unsigned
 int" instead of long unsigned int"
In-Reply-To: <20140915155052.1b3283ae@free-electrons.com>
References: <1410787585-20387-1-git-send-email-abrodkin@synopsys.com>
 <20140915155052.1b3283ae@free-electrons.com>
Message-ID: <1410790003.5875.33.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2014-09-15 at 15:50 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> > diff --git a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
> > new file mode 100644
> > index 0000000..78d4b10
> > --- /dev/null
> > +++ b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
> 
> Patch lacks a description + SoB.

Well first of all IMHO patch name is self-explanatory.
Than I didn't want to duplicate the same text in commit message and in
patch itself.

If you think this is helpful I will happily add the same text and URL in
the patch.

Let me know what do you think about it.

-Alexey
