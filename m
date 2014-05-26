From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 May 2014 07:02:29 -0300
Subject: [Buildroot] [WIP PATCH 0/5] Static linking fixes
In-Reply-To: <CAAXf6LUuv3vuX-wh1oYBuCfcUFvq356KPxCw61pqtOp10ESubg@mail.gmail.com>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LUuv3vuX-wh1oYBuCfcUFvq356KPxCw61pqtOp10ESubg@mail.gmail.com>
Message-ID: <53831135.4080405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/26/2014 05:13 AM, Thomas De Schampheleire wrote:

Hi.

> Your patches do not yet go as far as touching the
> BR2_PREFER_STATIC_LIB variable. We have talked about this in the past
> but as far as I know there is no-one that has actually wrote patches
> for it.
> See also http://www.elinux.org/Buildroot:DeveloperDaysFOSDEM2014#BR2_PREFER_STATIC_LIB_refactoring
> 
> It would be awesome if this refactoring could be taken up by someone
> in the 2014.08 cycle, but I don't know if anyone has time for this...

Well, that's why it's called a WIP :)
Also Thomas P. told me he has done something about it so i would just be
reinventing the wheel.
And if it's just a rename it's a pretty simple "find . -type f -exec sed
-i -e "s/BR2_PREFER_STATIC_LIB/BR2_SOMETHING/" {} \;" with some hand
editing of toplevel Config.in to adjust the description as well.
Regards.
