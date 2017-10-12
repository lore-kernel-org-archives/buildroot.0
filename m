From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 23:21:15 +0200
Subject: [Buildroot] [PATCH v2 1/2] tbb: new package
In-Reply-To: <CAPpUvYgu8OqDXqHXr8H_gG3pu2q12fCw94Y9jpcuh+ciVMKE9Q@mail.gmail.com>
References: <20170928235043.31891-1-bradford@density.io>
 <20170928235043.31891-2-bradford@density.io>
 <20171012224526.132fc274@windsurf.home>
 <CAPpUvYgu8OqDXqHXr8H_gG3pu2q12fCw94Y9jpcuh+ciVMKE9Q@mail.gmail.com>
Message-ID: <20171012232115.24a8e1d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Oct 2017 17:12:49 -0400, Bradford Barr wrote:

> > This patch should be Git formatted and have a proper commit title and
> > description.
> 
> As I lifted that patch from Yocto I thought it would be alright. I'll reformat
> and change the commit title and message.

We have stricter requirements than Yocto :)

> > This comment is not in sync with the dependencies of the package: C++,
> > dynamic library, glibc.
> >  
> 
> Would it be better if I added all the depends from above as part of
> this comment?

You must document all the dependencies in the Config.in comment. See
the Buildroot manual about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
