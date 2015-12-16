From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Dec 2015 19:46:40 -0300
Subject: [Buildroot] [PATCH] xutil_util-macros: move outside x11r7 scope
In-Reply-To: <20151216234223.6abe26c3@free-electrons.com>
References: <1449096338-8006-1-git-send-email-gustavo@zacarias.com.ar>
 <20151216234223.6abe26c3@free-electrons.com>
Message-ID: <5671E9D0.9000703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/12/15 19:42, Thomas Petazzoni wrote:

> Since you're renaming the Config.in option, some Config.in.legacy
> handling is needed.

Hi.
True, however much i doubt anybody is using it in their packages.

> I am wondering if util-macros isn't too generic. Should we name it
> xorg-util-macros ? xorg-autotools-macros ? But admittedly, that's not
> matching the upstream name.

In gentoo there's only one util-macros which has far more packages than 
buildroot, however in the future some other util-macros might appear so 
yes, xorg-util-macros sounds about right.
This is just the tip of getting wayland/weston/gtk3 support back in 
shape, it's still WIP in some aspects but i want to push as many as the 
little bits as possible since they don't hurt and i don't want to pile 
up patches.
I'll respin a v2.
Regards.
