From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 11:02:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL /
 EGL dependencies
In-Reply-To: <8266336.GrICkLfAp5@sagittea>
References: <1430943308-13319-1-git-send-email-bernd.kuhls@t-online.de>
 <20150710111952.5787d499@free-electrons.com>
 <8266336.GrICkLfAp5@sagittea>
Message-ID: <20150728110215.140a067a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 28 Jul 2015 10:23:23 +0200, J?r?me Pouiller wrote:

> > This doesn't make a lot of sense to me. Either you use EGL and you
> > don't X, or you have X and you don't EGL.
> As far as I understand, EGL is counterpart of GLX for GLESv2. As soon as you 
> want to use GLEsv2, you need EGL. Therefore, EGL is not mutually exclusive 
> with Xorg.
> 
> Here is an example program that work with Xorg and use EGL:
>   http://exoticorn.de/simplegl.tgz

Ah, okay. Then I indeed misunderstood this. I'll look again at Bernd's
patch then. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
