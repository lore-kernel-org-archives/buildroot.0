From: Christian Stewart <christian@paral.in>
Date: Mon, 27 Jul 2015 21:38:13 +0000
Subject: [Buildroot] [PATCH v8 1/1] mosh: new package
In-Reply-To: <20150726214130.196b8cbf@free-electrons.com>
References: <1437928447-26907-1-git-send-email-christian@paral.in>
 <20150726193517.40776cc8@free-electrons.com>
 <CA+h8R2qyYPpyNpASpjg1+8ivxhX2x8yvD4pdzhSn3W=ypphqQg@mail.gmail.com>
 <20150726214130.196b8cbf@free-electrons.com>
Message-ID: <CA+h8R2oUCpb1N3SoD+kX8N0gSFTjNM_9P_WKf8kcgPXPDQMM7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jul 26, 2015 at 12:41 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Christian Stewart,
>

[snip]


> Can you try anyway? Because what I'm proposing is significantly
> different from what you proposed in your pull request. My proposal has
> the advantage of keeping the locale output when 'locale' is available
> *and* warn that locale is not available otherwise. Basically it exactly
> matches the requirements of the upstream mosh developers.
>

Their opinion is that since Mosh is going to exit immediately after
"locale" is called anyways, they would prefer to just have the default
"command not found" be printed rather than check that the command exists at
all.


> We don't like to keep patches in Buildroot forever, so having an
> upstreamable solution is important.
>

Honestly it's not as bad as I thought originally to have this error, you
could probably safely delete the patch without any upstream changes or
repercussions.

Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150727/9a055602/attachment.html>
