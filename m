From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 12:40:10 -0700
Subject: [Buildroot] [PATCH v9 2/2] docker-engine: new package
In-Reply-To: <20160724213124.2ab58872@free-electrons.com>
References: <1469220779-31430-1-git-send-email-christian@paral.in>
 <1469220779-31430-2-git-send-email-christian@paral.in>
 <20160724152921.0601232e@free-electrons.com>
 <CA+h8R2rcOfaox359QdSX64wqzE8-6DK6=37p8z4K+oT=_S3FzA@mail.gmail.com>
 <20160724213124.2ab58872@free-electrons.com>
Message-ID: <CA+h8R2r0Liw0ent+BcObr9zhtSrhAo9kADWRQFAqk5wOBvQ+OA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 24, 2016 at 12:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 24 Jul 2016 12:13:30 -0700, Christian Stewart wrote:
>
>> Init scripts were written by Andrew so I will let him take those revisions.
>
> In this case, maybe you should just send a patch without any init
> script, and let Andrew send a follow-up patch for the init script.

Will do, in fact, I've already split the init files out into a
separate patch in my Github repo to give Andrew a head start on
something to edit.

> Seems weird, there are no headers on the target. Is it just used
> temporarily during the build?

I think so, yes. I checked in Staging Dir and there are no btrfs
headers, but they are in the target dir.

Best,
Christian
