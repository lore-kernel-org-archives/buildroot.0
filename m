From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 14:54:26 +0200
Subject: [Buildroot] ccache dependency issues
In-Reply-To: <CAAXf6LXXukE6yzOEC-U7vVEXq9mnkmjrG8M22=Ou00oVZ2VNJw@mail.gmail.com>
References: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
 <20130801113514.495c3b0d@skate>
 <CAAXf6LVwctGqfMYiG_fLGccTS0+yubt678k1bC95H_hmkQQ3QA@mail.gmail.com>
 <20130801135731.2ba53f36@skate>
 <CAAXf6LWJPwOwVbP4VOfe2cLRLHC1Ezgk=kx2vYEpEsaMcG7bVA@mail.gmail.com>
 <20130801140706.1ec7edbc@skate>
 <CAAXf6LXXukE6yzOEC-U7vVEXq9mnkmjrG8M22=Ou00oVZ2VNJw@mail.gmail.com>
Message-ID: <20130801145426.1dc22f4f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 1 Aug 2013 14:51:32 +0200, Thomas De Schampheleire wrote:

> > That's why I've NAKed additional 'hacks' such as
> > http://patchwork.ozlabs.org/patch/257372/ in the past. BTW, I think
> > moving ccache into the dependencies will avoid the need for this patch
> > 257372, and then we can apply http://patchwork.ozlabs.org/patch/257374/
> > and http://patchwork.ozlabs.org/patch/257375/.
> 
> Ok, sounds good.
> I'll try to create a patch soon, or if you want to do it that's fine
> by me as well.

If you can do it, that'd be great. I'd like to keep some time to merge
a few more things, and then do the -rc1 release after updating the
CHANGES file. So I won't have much time to look at this myself.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
