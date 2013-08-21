From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Aug 2013 05:55:41 +0200
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
In-Reply-To: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
References: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <CAAXf6LWFbdiJdncZcsZBqO25RAi9s5biqMTuUKK9d7LO-thCag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

Op 21-aug.-2013 03:11 schreef "Danomi Manchego" <danomimanchego123@gmail.com>
het volgende:
>
> Several of the lines in S50sshd script have a strange mix of spaces
> and tabs, that at least do not look consistent with neighboring lines.
> This patch makes the spacing consistent, and also strips the trailing
> spaces.
>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---

I haven't checked if there are such problems, but have you considered
checking all init scripts for the same type of problems and fixing them in
this same patch?

A rough way of finding these scripts is:
find -name "S*"

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/dd0323a0/attachment.html>
