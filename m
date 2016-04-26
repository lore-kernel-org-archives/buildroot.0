From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:32:56 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
Message-ID: <20160426223256.0798005b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:
> The previous commit [ef37472b20894c99cad758397f3cd6b90f933df1] was
> based on a newer version of Kodi :
> "with-platform=raspberry-pi2" is not yet supported in Kodi "Jarvis" branch.
> 
> Backport 2 patches from Kodi master branch into this one.
> 
> Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>

Thanks. I do remember seeing a report (on IRC ?) that commit
ef37472b20894c99cad758397f3cd6b90f933df1 was indeed causing some
problems.

Yann, Bernd, can you review/ack this patch from Beno?t?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
