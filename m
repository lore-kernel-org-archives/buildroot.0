From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:31:19 +0100
Subject: [Buildroot] [PATCH] gst1-shark: new package
In-Reply-To: <1549282708.7318.38.camel@railnova.eu>
References: <20190125091322.27522-1-judge.packham@gmail.com>
 <1549282708.7318.38.camel@railnova.eu>
Message-ID: <20190206113119.529e7e1d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Titouan,

On Mon, 04 Feb 2019 13:18:28 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> > +GST1_SHARK_VERSION = v0.5.5
> > +GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
> > +GST1_SHARK_SITE_METHOD = git
> > +GST1_SHARK_GIT_SUBMODULES =   
> 
> You could use the github package site helper here (see https://buildroo
> t.org/downloads/manual/manual.html#github-download-url) and get rid off this empty _GIT_SUBMODULES line (and benefit from the unified Buildroot infrastructure)

I'm not sure what happened, but the GIT_SUBMODULES variable is set to
YES in Chris patch.

BTW, your email client is badly configured:

 - It is rewrapping quotations
 - It is not wrapping long lines of your replies

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
