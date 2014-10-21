From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 21 Oct 2014 08:06:39 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
In-Reply-To: <54458B8C.4020505@crapouillou.net>
References: <54458B8C.4020505@crapouillou.net>
Message-ID: <CA+TH9Vm7c9BGBpRvkLziZM6ctainiTv5f-yb3Y-WxzdAkcfA3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

Could you send your config and a mono.log obtained with this command?

 make -j1 host-mono-reconfigure >> mono.log

Thank you!

2014-10-21 0:24 GMT+02:00 Paul Cercueil <paul@crapouillou.net>:
> In-Reply-To: 1413814528-26904-3-git-send-email-angelo.compagnucci at gmail.com
>
> Hi Angelo,
>
> Your package does not work here, host-mono fails to build.
> I attached the log file.
>
> Could the DLL files be downloaded instead of rebuilt? They should be
> arch-independent, so it may be easier and faster to just download them.
> Then only the runtime would need to be built.
>
> Regards,
>
> Paul
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
