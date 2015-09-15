From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 15 Sep 2015 23:25:48 +0200
Subject: [Buildroot] [PACH v2 00/38] efl bump to 1.15.1
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <55F88CDC.6080204@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Le 08/09/2015 23:19, Romain Naour a ?crit :
> This series bump the efl package to the latest release and also update all
> other packages which use efl.
[snip]
> 
> Patches  1 to  3 add some new packages used by efl

Since you're working regularly on X11 support in Buildroot, can you give your
opinion about these three patches:

xproto_printproto:
http://patchwork.ozlabs.org/patch/515567/

xlib_libXp:
http://patchwork.ozlabs.org/patch/515564/

xlib_libXpresent (your patch)
http://patchwork.ozlabs.org/patch/515563/

Do you see any issue that prevents to commit them ?

Best regards,
Romain
