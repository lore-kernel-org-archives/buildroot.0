From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 29 Mar 2021 21:42:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.2
In-Reply-To: <CAAP7uc+KkOsiPYvu=ac43X9nno-7LJw2DEtSExLETXR_VN+jXw@mail.gmail.com>
References: <20210329184934.14690-1-petr.vorel@gmail.com>
 <CAAP7uc+KkOsiPYvu=ac43X9nno-7LJw2DEtSExLETXR_VN+jXw@mail.gmail.com>
Message-ID: <YGItsBIZ32zztrcg@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > RFC: should I add also --enable-plugin-qcom-soc ?
> > (there is qcom-db410c-firmware package)

> The qcom-soc plugin is only relevant if the system where you're running the
> system is a Qualcomm SoC, and if you woulf plan to use the builtin modem as
> a modem in ModemManager. An obvious use case is e.g. qualcomm-phones
> running postmarketos.
Yep, in postmarketOS it does make perfect sense.

> For any other kind of setup, where MM is supposed to use external (e.g.
> USB, serial...) modems, the qcom-soc plugin is not needed. But it really
> wouldn't harm to have it either, it would just waste space (in the same way
> as other plugins that may never be used really).

> Maybe enable it? I should have probably done that in upstream really, as it
> doesn't really collide with other stuff
Maybe having an option for user to decide? Most of the people won't need it,
but it'd be nice to leave it for Dragonboard 410c (not sure if it uses modem).

Kind regards,
Petr
