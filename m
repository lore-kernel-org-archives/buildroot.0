From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Dec 2019 18:08:51 +0100
Subject: [Buildroot] [PATCH] package/apitrace: fix build failure due to
 gcc bug 68485 and 85180
In-Reply-To: <1bbd3516-035c-d0c9-ff67-f7077aceff4f@benettiengineering.com>
References: <20191227180020.22933-1-giulio.benetti@benettiengineering.com>
 <20191231153307.5ff83635@windsurf>
 <1bbd3516-035c-d0c9-ff67-f7077aceff4f@benettiengineering.com>
Message-ID: <20191231180851.7d079afb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Dec 2019 16:04:31 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > I'm a bit confused as to why the bug 68485 is worked-around through
> > CFLAGS and bug 85180 is worked-around through CXXFLAGS. Could you
> > explain this ?  
> 
> Sure, gcc bug 68485 is due to (included 3rd party) brotli, and it 
> manifests compiling C files, while gcc bug 85180 manifests on apitrace 
> while compiling C++ files.

This probably warrants a proper comment in the .mk file then.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
