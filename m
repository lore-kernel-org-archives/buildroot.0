From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 17:22:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
In-Reply-To: <CABbD_XA+wDX7V9r0AfHdQyUmgnruUUNCbih_P4i5Fe-psvKbnA@mail.gmail.com>
References: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
 <20141022152231.1ecdf27a@free-electrons.com>
 <CABbD_XA+wDX7V9r0AfHdQyUmgnruUUNCbih_P4i5Fe-psvKbnA@mail.gmail.com>
Message-ID: <20141022172255.3c766207@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Wed, 22 Oct 2014 17:09:22 +0200, K?roly Kasza wrote:

> I tried to standardize this package, but what you are telling makes sense.
> If you and Yann both agree to use snapshot.debian.org instead, than reject
> this patch
> and I will send a patchset, that completely removes BR2_DEBIAN_MIRROR from
> Buildroot,
> and changes all occurrences to snapshot.debian.org, is that OK with you?

It's OK with me, but I'd like to have some feedback from Yann and Peter
about this before you spend time fixing all the other packages. Maybe
there's some drawback I'm missing about using snapshot.debian.net, and
I don't want you to waste time on something that will not be merged.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
