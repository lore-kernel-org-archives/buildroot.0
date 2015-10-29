From: Viacheslav Volkov <sv99@inbox.ru>
Date: Thu, 29 Oct 2015 08:09:43 +0300
Subject: [Buildroot] [PATCH v2] v4l2grab: new package
In-Reply-To: <20151028222839.15dabdd9@free-electrons.com>
References: <1446019140-21478-1-git-send-email-sv99@inbox.ru>
 <20151028222839.15dabdd9@free-electrons.com>
Message-ID: <5631AA17.8050306@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, this utility wery similar.

Diffs:
1. Output jpeg
2. Allow yum -> internal convert

This utility not compilled by default.

> Dear Viacheslav Volkov,
>
> On Wed, 28 Oct 2015 10:59:00 +0300, Viacheslav Volkov wrote:
>> I not find libv4l2grab utility in the v4l2 distribution.
> http://git.linuxtv.org/cgit.cgi/v4l-utils.git/tree/contrib/test/v4l2grab.c ?
>
> Best regards,
>
> Thomas
