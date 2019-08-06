From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 6 Aug 2019 15:25:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-08-05
In-Reply-To: <20190806061557.5BDD2859EA@whitealder.osuosl.org>
References: <20190806061557.5BDD2859EA@whitealder.osuosl.org>
Message-ID: <0dc1dc65-e9aa-e09d-3b79-0e7476a37247@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 8/6/19 8:15 AM, Thomas Petazzoni wrote:
>      m68k     |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/3427924913af6d24eab65e6c79561b768120e18e |
>      arm      |        mosquitto-1.6.4         | NOK | http://autobuild.buildroot.net/results/5b53fd6a588ea60b5b2a17a9d7d235c82a2023c5 |

I guess these 2 should be fixed with Fabrice's patch 
7fc154da3d93650a4c3131744ad7bc387b395c0a 
(http://patchwork.ozlabs.org/patch/1141850/), which was not yet in the 
commit log of these builders (both at version 
5e45febb58d645de8875b9ad6bf964b0472555fa).

Regards,

Titouan
