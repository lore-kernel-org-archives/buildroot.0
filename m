From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 10 Feb 2017 07:52:30 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: add option for toolchains
 affected by GCC PR libstdc++/64735
In-Reply-To: <20170209213057.33fa79ba@free-electrons.com>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
 <20170209174759.15819-2-joerg.krause@embedded.rocks>
 <20170209213057.33fa79ba@free-electrons.com>
Message-ID: <1486709550.9565.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-02-09 at 21:30 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,??9 Feb 2017 18:47:54 +0100, J?rg Krause wrote:
> 
> > +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
> 
> I've taken a part of your commit log, and added it as a comment here.
> 
> > +config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > +	bool
> 
> Instead of having this option selected by the architecture code, I've
> added the relevant "default y" and "depends on" here. I believe it's
> not worth spreading these selects all over the place.

You're right! It's much cleaner this way. Thanks!

> Now that I write this, I realize I've written the logic in the wrong
> way, I'll fix that up now.

J?rg
