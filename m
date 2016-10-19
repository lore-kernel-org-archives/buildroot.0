From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 21:55:35 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
 enabled
In-Reply-To: <ea383c3d-9ace-bafe-5c32-0bc8fad656c3@mind.be>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
 <20161018172543.20a693fa@free-electrons.com>
 <CAJtjsKbAHTY4LwuS=oGpxhCf=hCupmk0Si7-kCTnA3YYtFbgfA@mail.gmail.com>
 <20161019145904.6a82c434@free-electrons.com>
 <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
 <ea383c3d-9ace-bafe-5c32-0bc8fad656c3@mind.be>
Message-ID: <20161019215535.52d363c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 18:27:29 +0200, Arnout Vandecappelle wrote:

> > Sure. However, It does break if I activate gettext with glibc:  
> 
>  That was exactly my concern with Thomas's proposal...

Yes, I also thought about it.

>  I would say: don't touch this now, and schedule it for discussion at the next
> BR developer meeting.

I don't think we can do that: there is a real build failure today if we
don't make a fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
