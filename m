From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 21 Oct 2011 15:51:51 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111021154303.43f98ccd@skate>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
Message-ID: <CAGm1_kuP2sT=fXdvmnHWbC=B0ie4v4swZTbs9eKHGXVAT5FERA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 21, 2011 at 3:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Mon, 17 Oct 2011 18:47:18 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> The current (unfinished) status of my slides is visible at:
>> ? http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
>
> First of all, I'd like to thank Peter, Baruch, Thomas, Arnout and Will
> who gave some useful comments about my slides.
>
> At the same URL above, I have published a new version, which hopefully
> addresses your comments, and also adds some more slides on various
> topics. The slides should now, at least in terms of contents, represent
> what I had in mind for this talk.
>
> Now, if you're still willing to spend some time on this, I'd like to
> have comments on:
> ?* remaining english typos, wording improvements, etc.
> ?* suggestions of additional contents/topics if there is something I
> ? missed. Like if you use best practices that aren't described in
> ? those slides.

thanks for sharing this slides. I found some really useful issues I
have never thought about before.

Page 23 (setting root password):

1. what have you set?
2. $TARGET_DIR is not working for me, but $1/etc/shadow is working

Yegor
