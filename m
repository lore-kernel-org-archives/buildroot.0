From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 20:50:31 +0200
Subject: [Buildroot] [PATCH] swig: enable support for Node.js >= 7.x
In-Reply-To: <CAGm1_kvanZjOBLtt4N+ucMhKJ1u+Y6vowr4Gju6rp5dM_LYjCg@mail.gmail.com>
References: <1506686356-4509-1-git-send-email-yegorslists@googlemail.com>
 <20171008155252.5f08f349@windsurf>
 <CAGm1_kvanZjOBLtt4N+ucMhKJ1u+Y6vowr4Gju6rp5dM_LYjCg@mail.gmail.com>
Message-ID: <20171008205031.44850462@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 8 Oct 2017 19:16:11 +0200, Yegor Yefremov wrote:

> > To be honest, I hesitated a bit, those patches are a bit big and
> > invasive, and have not been merged upstream yet. I've merged anyway,
> > but we might need to drop them at the next swig bump if they haven't
> > been merged upstream.  
> 
> Thanks for merging. The problem is that the project lacks a Node.js
> maintainer. That's why none has applied the patch.

Hopefully with all the comments received in the github PR, the Node.js
maintainers will apply those patches.

> SWIG as such has nothing to do with Node.js directly, but it creates
> code, that will be compiled against node.js via node-gyp utility [1].
> BR uses newest Node.js version with removed obsolete APIs. That's why
> we need this patch, but SWIG has no direct dependency to host-nodejs.

OK, makes sense. Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
