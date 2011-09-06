From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Sep 2011 10:04:19 -0300
Subject: [Buildroot] ncurses: build error
In-Reply-To: <4E66169D.70209@visionsystems.de>
References: <4E66159C.5070309@visionsystems.de>
 <4E66169D.70209@visionsystems.de>
Message-ID: <19dc87b07567423c140c1d303a3f968c@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 06 Sep 2011 14:48:29 +0200, Yegor Yefremov wrote:

> reverting two latest commits till
> 7d584285c8b32d8a419f8a5fb40efce66e8e5e24 got compilation working.
> My build system opensuse 10.3
>
> Yegor

Try my "ncurses: fix host build breakage" patch, it fixes it for me 
without the need to revert (we want host tic).
Regards.
