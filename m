From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 15:40:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging
 install steps
In-Reply-To: <CAEyMn7bWYSitctm2hA6h-BTByHwOuYRyEUkVK-d6a2SsmDeiQQ@mail.gmail.com>
References: <20191103060113.4884-1-heiko.thiery@gmail.com>
 <20191108225833.6d81ea18@windsurf>
 <CAEyMn7Yg83V6bQoCG3-JH0ScRm=3qAxVLM3fKA_k1naKjFQqJw@mail.gmail.com>
 <20191111145304.00972312@windsurf.home>
 <CAEyMn7Zm+7k+Mwugu-oxRGUjfsyV3btam3DCdR+8mrenzdCzug@mail.gmail.com>
 <20191111152732.43c195c1@windsurf.home>
 <CAEyMn7bWYSitctm2hA6h-BTByHwOuYRyEUkVK-d6a2SsmDeiQQ@mail.gmail.com>
Message-ID: <20191111154027.0e7bb998@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 15:35:28 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > Hence my question: do you have a simple configuration that reproduces
> > the "wrongly installed files in wrong locations" issue ?  
> 
> Ok .. I was not aware of that failure. Simple misunderstanding. I
> don't have a config for that.

So how did you test your patch http://patchwork.ozlabs.org/patch/1188504/ ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
