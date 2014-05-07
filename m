From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 May 2014 19:39:44 +0200
Subject: [Buildroot] [PATCH] cmake: disable building of ccmake
In-Reply-To: <1399480839-30134-1-git-send-email-fabio.porcedda@gmail.com>
References: <1399480839-30134-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <536A6FE0.4060007@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Fabio Porcedda wrote:
> The ccmake program requires the ncurses package so it fails to build if
> the host system does not have it installed.
> To get rid off the ncurses dependency do not build anymore the ccmake
> program because it's not needed by buildroot.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Alexander Potashev <aspotashev@gmail.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
