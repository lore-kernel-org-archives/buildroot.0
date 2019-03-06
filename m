From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Mar 2019 22:54:06 +0100
Subject: [Buildroot] [PATCH] package/musl: remove rcrt1.o from target
 installation
In-Reply-To: <CADYdroMAZ12BZH6q5472gAOuuDfT5RQVXA3SP1ts=7cW2yhGrQ@mail.gmail.com>
References: <20190306163316.6117-1-norbert.lange@andritz.com>
 <20190306174841.4f8b67a1@windsurf>
 <CADYdroMAZ12BZH6q5472gAOuuDfT5RQVXA3SP1ts=7cW2yhGrQ@mail.gmail.com>
Message-ID: <20190306225406.466569bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Wed, 6 Mar 2019 18:09:19 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> > Could you give some more details ?  
> 
> 
>  rcrt1.o is a new startup for "static-pie" apps, and only needed for building,
> should not end up in the target filesystem

OK.

> > In fact, your patch does not remove rcrt1.o from target installation:
> > it ensures that the target installation does *NOT* remove it from
> > TARGET_DIR.  
> 
> One of us is eligible for a legasthenic fund, either its you or I am
> a really badly affected cause I still cant find a fault in the patch.

It was me :-) The patch looks good!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
