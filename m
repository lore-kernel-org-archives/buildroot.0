From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:58:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/spidermonkey: depends on host
 gcc >= 4.9
In-Reply-To: <CAFSsvmoB=3gvY0-NaUFb09r73+0mx1z6ap=JED4-LLfBuD0-5w@mail.gmail.com>
References: <20191204214913.718567-1-aduskett@gmail.com>
 <CAFSsvmoB=3gvY0-NaUFb09r73+0mx1z6ap=JED4-LLfBuD0-5w@mail.gmail.com>
Message-ID: <20191205215828.7258d035@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 4 Dec 2019 13:54:41 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Before this get's added I do want to make another suggestion:
> 
> Open embedded also has a patch that reverts the reliance on C++14
> back to C++11, allowing the host GCC version to be >= 4.8.
> 
> https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C%2B%2B-standard.patch

So what this patch seems to imply is that in fact gcc 4.9 is not really
required by the spidermonkey code. If that's the case, then yes I
believe having the patch is probably nicer than having to propagate the
dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
