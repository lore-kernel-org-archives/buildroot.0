From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 13:38:35 +0200
Subject: [Buildroot] [git commit] package/python-pybind: new package
In-Reply-To: <87sgdvkewr.fsf@dell.be.48ers.dk>
References: <20200610205210.71B2481F5F@busybox.osuosl.org>
 <874kqcmnti.fsf@dell.be.48ers.dk>
 <20200712234050.14cb61d9@windsurf.home>
 <87sgdvkewr.fsf@dell.be.48ers.dk>
Message-ID: <20200713133835.374c8280@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 10:17:08 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > It's a header-only library, so by itself, it doesn't need C++ to build,
>  > at least that was my understanding.  
> 
> True, but you cannot actually do anything with it unless you have C++
> support in the toolchain - So I don't think it makes any sense to show
> it then.

Yes, I agree, we need to change that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
