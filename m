From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 20 Jun 2012 15:07:29 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal
 compliance info
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <4FE1CB11.7030508@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Luca Ceresoli wrote:
> Hi,
>
> here is the third version of the legal-info feature implementation.

Meaning the fourth, of course.

>
> Links to discussion of previous versions:
> v1: http://lists.busybox.net/pipermail/buildroot/2012-January/049590.html
> v2: http://lists.busybox.net/pipermail/buildroot/2012-March/051132.html
> v3: http://lists.busybox.net/pipermail/buildroot/2012-May/053574.html
>
> This version is only a minor update to fix various issues reported by other
> developers. There are not changes to the general structure, so please see
> the link above for v3 for a detailed presentation.
>
> Let me repeat only my plea to all Buildroot developers to read and give
> feedback on patch 9.
> It gives an advice from Buildroot developers to Buildroot users about how to
> comply with both Buildroot's and the packages' licenses.
> Of course this must match as much as possible what the developers think, so
> please read it and give either your different views or your ack (preferably
> with a formal Acked-by tag).
>
> Thanks.

Peter, are you considering to merge this patchset into mainline Buildroot?

If you are, I'll submit a rebased version in the next few days, with the 
addition
of the Signed-off-by tags received so far. There is no further change 
required
AFAIK, and only a trivial conflict.

I also think your opinion about patch 9 is very important, since you're the
maintainer.

Thanks,
Luca
