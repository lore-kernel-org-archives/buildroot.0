From: Luca Ceresoli <list@lucaceresoli.net>
Date: Mon, 26 Jul 2010 21:46:34 +0200
Subject: [Buildroot] [PATCH] qt: fix alsa-lib dependency
In-Reply-To: <1279747259-10054-1-git-send-email-luca@lucaceresoli.net>
References: <1279747259-10054-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <4C4DE61A.7070101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

luca at lucaceresoli.net wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
>
> If BR2_PACKAGE_QT_AUDIO_BACKEND=y, QtMultimedia requires the audio backend
> to be already in staging in order to compile.
> The backend is system-dependent, but since buildroot builds Linux systems
> only, it is safe to assume that the it will be always ALSA.
>   

Peter, are you considering this for 2010.08?

Thanks,
Luca
