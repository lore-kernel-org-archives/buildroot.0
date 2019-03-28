From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 22:53:05 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <87ef6qlnow.fsf@dell.be.48ers.dk>
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf> <87bm1w9ck5.fsf@haabendal.dk>
 <20190328121441.02648d09@windsurf> <87tvfnav5a.fsf@gmail.com>
 <02a2e44d-45e9-f3fc-8c1f-5cf7a8b8f5d8@mind.be>
 <20190328210043.41fc2c0d@windsurf>
 <87ef6qlnow.fsf@dell.be.48ers.dk>
Message-ID: <20190328225305.174d234e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 21:59:59 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > I'm fine with this as well. It means we would no longer support glibc
>  > 2.19 anymore.  
> 
> Didn't you just last month argue against removing support for glibc <
> 2.19 support (the runc security fix):

In fact, my last sentence lacked an ending question mark. I wanted to
ask if we were dropping support entirely for glibc 2.19, or just saying
"glibc 2.19 is not long important enough to worry too much about it,
especially when it's just for the few packages that use the <fts.h>
interface".

But if your point is to have me say that I don't have a clear and
well-defined opinion, then yes it's the case. I do see a number of
companies/customers continue to use old toolchains and therefore
dropping support too quickly tends to be annoying. On the other side,
we clearly see the maintenance burden that keeping support for old
toolchains creates.

> I don't have a problem dropping support for ancient toolchains when they
> add too much complexity, but the lack of large file support is mtree is
> probably not really reason enough.

So, what do you suggest ? What I proposed with the hidden option ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
