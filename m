From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 25 Nov 2020 19:14:27 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/systemd: disable
 portabled"
In-Reply-To: <DM6PR01MB3755A13BD450506C5E7312BEF3FA0@DM6PR01MB3755.prod.exchangelabs.com>
References: <20201125152717.1984-1-fgervais@distech-controls.com>
 <CADYdroNf18UG_dm9rWqLaW5morJm=5kz6LUZ-rMVmC--ixS8pA@mail.gmail.com>
 <DM6PR01MB3755A13BD450506C5E7312BEF3FA0@DM6PR01MB3755.prod.exchangelabs.com>
Message-ID: <CADYdroOGDZoHtbruupAjFJASOhMQxUmQE2Qsi33STyxTrWV76g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 25. Nov. 2020 um 18:05 Uhr schrieb Gervais, Francois
<FGervais@distech-controls.com>:
>
> I'm not sure, it's been stated as moved in
> https://github.com/systemd/systemd/blob/master/NEWS:
>
> * portablectl is now officially supported and has thus moved to
>    /usr/bin/.
>
> At least since version v240 from what I can see.
>
> Other than that, I'm not against the option to enable it but I mean,
> it was blindly disabled in the first place right?

You are right, I mixed up systemd-portabled and portablectl.
The reasons I disabled portabled was that

-   its still labeled as preview at https://systemd.io/PORTABLE_SERVICES/
-   buildroot should attempt to be minimalistic by default
-   no one objected

Norbert
