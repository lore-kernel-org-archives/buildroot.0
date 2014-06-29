From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 17:37:43 +0200
Subject: [Buildroot] [PATCH] lsof: bump to version 4.87
In-Reply-To: <1404054303-11800-1-git-send-email-gustavo@zacarias.com.ar>
References: <1404054303-11800-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140629173743.08884636@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 29 Jun 2014 12:05:03 -0300, Gustavo Zacarias wrote:
> And install to /usr/bin/lsof rather than /bin/lsof otherwise we still
> keep busybox lsof.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/lsof/{lsof-4.85-makefile.patch => lsof-0001-makefile.patch}   | 0
>  package/lsof/{lsof-4.85-noportmap.patch => lsof-0001-noportmap.patch} | 0

Those two patches have the same sequence number. Fixed and applied,
thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
