From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:45:17 +0200
Subject: [Buildroot] [PATCH v3 00/11] The big webkitgtk bump
In-Reply-To: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429436906-15222-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150419144517.76403dd8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 19 Apr 2015 06:48:15 -0300, Gustavo Zacarias wrote:

> Gustavo Zacarias (11):
>   gcc-final: install libatomic
>   toolchain-external: install libatomic
>   harfbuzz: add host variant
>   cairo: add host variant
>   pango: add host variant
>   librsvg: add host variant
>   librsvg: add hash file

I've applied up to this point, so that at least you don't need to carry
those preparation patches anymore.

>   webkitgtk24: new package

I have some comments/questions on this one. I'll reply to the patch
itself.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
