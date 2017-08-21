From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Aug 2017 21:33:21 -0300
Subject: [Buildroot] [PATCH/next v2 1/1] package/lzo: switch to cmake
References: <20170820080744.8947-1-bernd.kuhls@t-online.de>
Message-ID: <599a2a512f078_46651592878807e3@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Aug 20, 2017 at 05:07 AM, Bernd Kuhls wrote:

> autoreconf for the host package is broken after bumping to 2.10:
> http://lists.busybox.net/pipermail/buildroot/2017-August/200634.html
> 
> To solve the problem we switch to cmake.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

[It fixes the scenarios tested by the test infra in the next branch
 https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/29798693 ]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
