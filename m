From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 21:31:41 +0100
Subject: [Buildroot] [PATCH 2/2] uclibc: add hash for uclibc-ng
In-Reply-To: <1425409843-13569-2-git-send-email-gustavo@zacarias.com.ar>
References: <1425409843-13569-1-git-send-email-gustavo@zacarias.com.ar>
 <1425409843-13569-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150304213141.7256a376@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Mar 2015 16:10:43 -0300, Gustavo Zacarias wrote:

>  # Locally calculated after checking pgp signature (vanilla)
>  # Locally calculated (ARC)
> +# http://downloads.uclibc-ng.org/releases/1.0.0/uClibc-ng-1.0.0.tar.xz.sha256 (uClibc-ng)
>  sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
>  sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
> +sha256	56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1	uClibc-ng-1.0.0.tar.xz

I've changed the file to have the comment next to the corresponding
line, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
