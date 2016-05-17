From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 17 May 2016 10:53:02 -0300
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <CABLs7GV7ohYiPxGzn=2mp=U_jfUS66Q2HvEm6q0jDiiQuijh4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2016-05-17 10:36 GMT-03:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
>>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/31ec8fed2390b8fece70ec7168019c736fe66b01/
>
> This is a long-standing issue of static linking with chocolate-doom, it
> forgets to link with libstdc++. Rodrigo, you contributed this package,
> and already fixed some static linking issues with it. Can you look at
> this one, or alternatively decide that we don't want to support static
> linking for chocolate-doom?
>

Sure. I'll have a look into it later when I get back from work.

Regards,
Rodrigo
