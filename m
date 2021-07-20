From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 20 Jul 2021 10:45:31 +0200
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.24.8
In-Reply-To: <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
References: <20210712091827.335522-1-aleksander@aleksander.es>
 <20210716225449.382c1426@windsurf>
 <CAGm1_kuFhe7U+qYMRiPP2htmfCDR4kmOKFaX0Vnsfh0XvSQVUA@mail.gmail.com>
Message-ID: <CAAP7ucKbpPfUROc=rm2U4idc23+MOC8TJ405Qxf-M5CkHnz=TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
> I still experience this error [1]. Any ideas?
>
> I have also applied libgudev patches as their build was failing.
>
> [1]
> http://autobuild.buildroot.net/results/f8a81aad0e262a567a2b31712575472ae92e5518/build-end.log
>
>
My eyes are failing, I'm not sure which is the issue that triggers the
build error. Is it the -Winline issues? The build should go on in that
case, as we don't have -Werror. Not really sure.


-- 
Aleksander
https://aleksander.es
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210720/840662aa/attachment-0001.html>
