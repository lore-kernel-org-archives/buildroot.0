From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 16:06:40 +0200
Subject: [Buildroot] [PATCH 00/29] qt,
 qt5: only ever use the free/opensource licenses
In-Reply-To: <cover.1492979449.git.yann.morin.1998@free.fr>
References: <cover.1492979449.git.yann.morin.1998@free.fr>
Message-ID: <20170429160640.683e09bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Apr 2017 22:31:12 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (29):
>       package/qt: default to approved license
>       package/qt5base: default to approved license
>       package/qt: always use the opensource license
>       package/qt5base: always use the opensource license
>       package/qt53d: always use the opensource license
>       package/qt5canvas: always use the opensource license
>       package/qt5connectivity: always use the opensource license
>       package/qt5declarative: always use the opensource license
>       package/qt5enginio: always use the opensource license
>       package/qt5graphicaleffects: always use the opensource license
>       package/qt5imageformats: always use the opensource license
>       package/qt5location: always use the opensource license
>       package/qt5multimedia: always use the opensource license
>       package/qt5quickcontrols: always use the opensource license
>       package/qt5quickcontrols2: always use the opensource license
>       package/qt5script: always use the opensource license
>       package/qt5sensors: always use the opensource license
>       package/qt5serialbus: always use the opensource license
>       package/qt5serialport: always use the opensource license
>       package/qt5svg: always use the opensource license
>       package/qt5tools: always use the opensource license
>       package/qt5webchannel: always use the opensource license
>       package/qt5webkit: always use the opensource license
>       package/qt5websockets: always use the opensource license
>       package/qt5x11extras: always use the opensource license
>       package/qt5xmlpatterns: always use the opensource license
>       configs: drop Qt/Qt5 license approval option
>       package/qt: drop option for license approved
>       package/qt5: drop option for license approved

Series applied. As suggested by Arnout, I've dropped the legacy
handling in the last two patches, as it doesn't serve any purpose.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
