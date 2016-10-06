From: daggs <daggs@gmx.com>
Date: Thu, 6 Oct 2016 11:52:38 +0200
Subject: [Buildroot] odroidc2 broken in latest git
In-Reply-To: <CAK4VdL2-Ki_JSYurH7u4PsH+Cxb=aF_4AvKuhB4mXWazg8q5pQ@mail.gmail.com>
References: <trinity-97d923e3-1509-4df6-8cea-c6856bedc7ff-1475734297864@3capp-mailcom-bs04>,
 <CAK4VdL2-Ki_JSYurH7u4PsH+Cxb=aF_4AvKuhB4mXWazg8q5pQ@mail.gmail.com>
Message-ID: <trinity-f9574332-c876-48f3-b512-a1ac7e50f662-1475747558640@3capp-mailcom-bs03>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Erico,

> Hi Dagg,
> I have tested it a few days ago and found out that it is not working only with gcc 5.x toolchains, please see:
> https://bugs.busybox.net/show_bug.cgi?id=9326
> Erico

you are absolutly correct, if I'm not mistaken gcc 5.x is default now and current u-boot does not support it, only 4.9.x
I'll submit a patch to fix it.
according to the guys at hardkernel, they are suppose to ship a new buildroot based on amlogic's 2016.8 so hopefully there will be some support for 5.x which can be migrated to mainline git.

thanks for the tip.

Dagg.
