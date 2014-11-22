From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:02:33 +0100
Subject: [Buildroot] [PATCH v4 0/9] target permissions
In-Reply-To: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141122190233.314a6e48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:18:59 -0300, Guido Mart?nez wrote:

> Guido Mart?nez (9):
[...]
>   nitrogen6x: use install instead of cp
>   boot/grub: use install instead of cp
>   fs/iso9660: use install instead of cp

I've applied those three patches to the next branch. The other ones are
more sensitive, so I'll wait to get more feedback/review, but applying
those three patches means you'll have less patches to carry in your
branch :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
