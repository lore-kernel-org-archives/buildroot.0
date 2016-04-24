From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:06:27 +0200
Subject: [Buildroot] [PATCH 0/3 v2] xorg: fix installation paths (branch
 yem/xorg)
In-Reply-To: <20160424161644.GB2583@free.fr>
References: <cover.1457719643.git.yann.morin.1998@free.fr>
 <20160421220137.4a88ed00@free-electrons.com>
 <20160424161644.GB2583@free.fr>
Message-ID: <20160424230627.5d24bf92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 18:16:44 +0200, Yann E. MORIN wrote:

> > One important thing that this cover letter doesn't explain is why we
> > don't fix pkg-config instead?
> 
> (trying to reconnect the dots...)
> 
> Right. But in turns out that pkg-config has been fixed, yet there still
> are errors, because the Xorg packages define an "sdk_dir" (or so)
> variable, and use that to prefix a lot of directories, of which the
> runtime directories.
> 
> So, it's not about a pkg-config issue, but mainly because all of the
> Xorg packages are bran-damaged and try (and fail) to circumvent
> pkg-config functionality by setting variables that are not common
> pkg-config variables.

It would be good if you could summarize again the whole story.
Preferably not in the cover letter, but rather in one of the commit
log, so that it get preserved in the commit history rather than being
lost in the mailing list archives.

I'd really like to understand if we need to do something like we
propose, or if we have alternate solutions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
