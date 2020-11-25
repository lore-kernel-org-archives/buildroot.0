From: Gervais, Francois <FGervais@distech-controls.com>
Date: Wed, 25 Nov 2020 22:53:38 +0000
Subject: [Buildroot] [PATCH 1/1] Revert "package/systemd: disable
 portabled"
In-Reply-To: <CADYdroOGDZoHtbruupAjFJASOhMQxUmQE2Qsi33STyxTrWV76g@mail.gmail.com>
References: <20201125152717.1984-1-fgervais@distech-controls.com>
 <CADYdroNf18UG_dm9rWqLaW5morJm=5kz6LUZ-rMVmC--ixS8pA@mail.gmail.com>
 <DM6PR01MB3755A13BD450506C5E7312BEF3FA0@DM6PR01MB3755.prod.exchangelabs.com>,
 <CADYdroOGDZoHtbruupAjFJASOhMQxUmQE2Qsi33STyxTrWV76g@mail.gmail.com>
Message-ID: <DM6PR01MB37551BBEB5EFC4271E66E90BF3FA0@DM6PR01MB3755.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I sent a new version of the patch which adds the menu entry.

This patch however has not been marked as Superseded in patchwork.

Is this something manually done by the admins or it there
something I should have done differently?


From: Norbert Lange <nolange79@gmail.com>
Sent: November 25, 2020 1:14 PM
To: Gervais, Francois <FGervais@distech-controls.com>
Cc: buildroot <buildroot@buildroot.org>; Maxime Hadjinlian <maxime.hadjinlian@gmail.com>; Yann E . MORIN <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/1] Revert "package/systemd: disable portabled" 
?
Am Mi., 25. Nov. 2020 um 18:05 Uhr schrieb Gervais, Francois
<FGervais@distech-controls.com>:

You are right, I mixed up systemd-portabled and portablectl.
The reasons I disabled portabled was that

-?? its still labeled as preview at https://systemd.io/PORTABLE_SERVICES/
-?? buildroot should attempt to be minimalistic by default
-?? no one objected

Norbert
