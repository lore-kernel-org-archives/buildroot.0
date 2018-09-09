From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:19:03 +0200
Subject: [Buildroot] [PATCH] lua: remove 5.2.x version
In-Reply-To: <CAB0FRstkE99C=mEK9BBSnQhd4Fqa0Ym1g_LBfteOJGuN1LXqHA@mail.gmail.com>
References: <20180908161118.4493-1-francois.perrad@gadz.org>
 <20180908213537.72485d66@windsurf.home>
 <CAB0FRstkE99C=mEK9BBSnQhd4Fqa0Ym1g_LBfteOJGuN1LXqHA@mail.gmail.com>
Message-ID: <20180909151903.0fecb844@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Sep 2018 13:04:53 +0200, Fran?ois Perrad wrote:

> Lua 5.3.5 will be the last one of its serie.
> Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
> Lua 5.2.4 was released on 2015.
> For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
> On BR, Lua 5.3 is the default version since 2016.02.
> 
> So, the serie which could be removed is the 5.2.x.
> We could wait some days for other user feedback.
> 
> Note: see discussion when 5.3.x was introduced :
> http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html

Thanks for those explanations. Could you resend the same commit, but
with a similar explanation in the commit log ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
