From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 26 Jan 2010 14:19:22 +0100
Subject: [Buildroot] [PATCH] SDL needs tslib to be compiled first when
	selected.
In-Reply-To: <87eildqcty.fsf@macbook.be.48ers.dk>
References: <1264507483-25049-1-git-send-email-julien.boibessot@free.fr>
	<87eildqcty.fsf@macbook.be.48ers.dk>
Message-ID: <4B5EEBDA.70901@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard a ?crit :
>
>  julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
>  julien> If SDL is built before tslib, then SDL can't detect it at
>  julien> configure time and so touchscreen's support in SDL is crappy.
>
> Committed, thanks!
>   
Should I also add a "--enable-tslib=no" configure option (not tested) to
SDL, when tslib is not selected in BR ?
(like for directfb or x11)

Regards,
Julien
