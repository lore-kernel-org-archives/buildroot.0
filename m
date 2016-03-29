From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Mar 2016 10:12:55 -0300
Subject: [Buildroot] [PATCH] libgtk3: bump to version 3.20.1
In-Reply-To: <20160329144611.5a8bb856@free-electrons.com>
References: <1458924831-25952-1-git-send-email-gustavo@zacarias.com.ar>
 <20160329144611.5a8bb856@free-electrons.com>
Message-ID: <56FA7F57.1050006@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/03/16 09:46, Thomas Petazzoni wrote:

> Looks like the Wayland support needs memfd, which is available only if
> fairly recent kernel versions:
>
>    http://autobuild.buildroot.org/results/473/473fb2f416311ee8a8a8719e3fb3689d9226f451/build-end.log
>
> Probably needs some linux headers version dependency. Could you look
> into this?
>
> Thanks!
>
> Thomas

Hi.
Definitely, >= 3.17, patch sent, thanks!
Regards.
