From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 15:56:32 +0200
Subject: [Buildroot] [PATCH] libinput: remove unneeded patch
In-Reply-To: <20160513134818.GU2419@tarshish>
References: <e86e590ddd7ea6cbc8886ed86d78ee48ae1265db.1463119792.git.baruch@tkos.co.il>
 <20160513075625.GT2419@tarshish>
 <20160513152314.19eebd42@free-electrons.com>
 <20160513134818.GU2419@tarshish>
Message-ID: <20160513155632.046b9cfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 16:48:18 +0300, Baruch Siach wrote:

> I see. It's just that the patch being removed itself says:
> 
>   This fixes a conflict between libevdev and libinput on the definition
>   of the log_msg() symbol.

Hm, right.

> Should I respin with a clearer commit log?

I guess it would be good, since Peter was also confused by your commit
log.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
