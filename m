From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Oct 2013 10:59:51 +0200
Subject: [Buildroot] [PATCH] manual: rename section name of package lists
In-Reply-To: <ab29385dc7907035d6d7.1381735358@argentina>
References: <ab29385dc7907035d6d7.1381735358@argentina>
Message-ID: <CAHXCMMLepzmZKEUnWmfe6+b7mSPjkbWo+pyW_OVBW2v_2VYMHg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


2013/10/14 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> The original titles did no longer correspond with the actual menu names.
> Additionally, choose a name that better reflects the fact that this is a
> list.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  docs/manual/appendix.txt |  8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
> --- a/docs/manual/appendix.txt
> +++ b/docs/manual/appendix.txt
> @@ -11,14 +11,14 @@ include::makeusers-syntax.txt[]
>  // Automatically generated lists:
>
>  [[package-list]]
> -Package Selection for the target
> ---------------------------------
> +List of target packages available in Buildroot
> +----------------------------------------------
>
>  include::package-list.txt[]
>
>  [[host-package-list]]
> -Host utilities
> ---------------
> +List of host utilities available in Buildroot
> +---------------------------------------------
>
>  The following packages are all available in the menu +Host utilities+.
>
> I was a bit skeptical about the trailing "available in Buildroot"...
But in the end, this clearly states we are talking about Buildroot content
and nothing else. ;)

So, you have my ack:
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131014/bcdcb585/attachment.html>
