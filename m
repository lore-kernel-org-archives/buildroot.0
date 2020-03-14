From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:18:23 +0100
Subject: [Buildroot] [PATCH-for-2020.02.x v2] package/qt5xmlpatterns:
 enable qml module
In-Reply-To: <20200313204415.2036-1-ps.report@gmx.net>
References: <20200313204415.2036-1-ps.report@gmx.net>
Message-ID: <20200314151823.39b5c55f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri, 13 Mar 2020 21:44:15 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5declarative:
>  - remove unneded dependency on qt5mlpatterns
> 
> qt5xmlpatterns:
>  - add optional dependency on qt5declarative
>  - add target install step of the optional qml files
> 
> Reported-by: Nimai Mahajan <nimaim@gmail.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Will you send a similar patch for master ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
