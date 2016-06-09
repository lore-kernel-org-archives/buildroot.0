From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 9 Jun 2016 08:03:08 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.43
In-Reply-To: <20160608235202.7af6e7d7@free-electrons.com>
References: <1463598503-13738-1-git-send-email-gustavo@zacarias.com.ar>
 <20160608235202.7af6e7d7@free-electrons.com>
Message-ID: <57594CEC.5020200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/06/16 18:52, Thomas Petazzoni wrote:

> This update is causing some build failures, it would be good if you
> could have a look:
>
> http://autobuild.buildroot.net/results/25c/25c042d2862affebf552ed24bc2a58e0c484226f/build-end.log
> (missing link against -lrt)
>
> Thanks for your help!
>
> Thomas

Hi.
Ahhh yes the dreaded clock_gettime() in librt.
Bump + fix sent, thanks.
Regards.
