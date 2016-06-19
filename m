From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Jun 2016 00:31:29 -0300
Subject: [Buildroot] [PATCH 1/3] imagemagick: bump to version 7.0.2-0
In-Reply-To: <20160616202243.GI3665@free.fr>
References: <1465994063-17292-1-git-send-email-gustavo@zacarias.com.ar>
 <20160616202243.GI3665@free.fr>
Message-ID: <57661211.1010403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/06/16 17:22, Yann E. MORIN wrote:

> Our oldest bug is about imagemagick not finding ghostscript fonts:
>      https://patchwork.ozlabs.org/patch/484767/
>
> Since you just bumped imagemagick, did you have a look if it still
> applies?
>
> Regards,
> Yann E. MORIN.

Hi Yann.
The 'default' gs font logic in configure.ac probes for the existance of 
some random font in the standard directories, so i'd bet it's still 
required unless we're building with such fonts being present in the 
build machine.
Regards.
