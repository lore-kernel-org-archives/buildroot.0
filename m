From: Charles Duffy <charles@dyfis.net>
Date: Wed, 14 Oct 2015 22:23:12 +0000
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
	BR2_SHARED_LIBS
In-Reply-To: <20151014233507.23a93657@free-electrons.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
 <20151014233507.23a93657@free-electrons.com>
Message-ID: <CAEHm_shswg6pPrMgif+OY2w3qqW15d1Amkf4avUPum_OpF-MEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 14, 2015 at 4:35 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Could you instead try the following change:
>
> -                       --disable-gcc-wrapper)
> +                       --disable-gcc-wrapper \
> +                       $(SHARED_STATIC_LIBS_OPTS))
>
>
Works perfectly. Should I bother resubmitting, or are you inclined to make
the change directly?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151014/c6a2d855/attachment.html>
