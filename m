From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Wed, 12 Aug 2020 09:09:23 +0200
Subject: [Buildroot] [PATCH] package/ettercap: new package
In-Reply-To: <20200811225120.622906-1-romain.naour@gmail.com>
References: <20200811225120.622906-1-romain.naour@gmail.com>
Message-ID: <CAHpTZwmq=ZNjT1erTCS1qWom3NGHRuH0jhEjnhUz2O9a9AKjTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Thank's for your answer.

On Wed, Aug 12, 2020 at 12:51 AM Romain Naour <romain.naour@gmail.com>
wrote:

> From: Jugurtha BELKALEM via buildroot <buildroot@busybox.net>
>
> TODO
>
> Q: is geoip really needed or used ?
> Because there is no GeoIP.dat file in the rootfs
> (/usr/local/share/GeoIP/GeoIP.dat).
> Note: Fedora disabled GeoIP support for Ettercap!
>

Yes geoip is required to build ettercap. GeoIP.dat can be provided by the
user (they can be downloaded from maxmind website) to improve Ettercap IP
tracking results (but ettercap works fine without them).

Best regards.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200812/43ff8ff1/attachment.html>
