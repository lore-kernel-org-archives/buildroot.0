From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Jun 2014 19:47:44 -0300
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <20140622224049.GF21768@free.fr>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622215442.4c060328@free-electrons.com>
 <53A759EB.8090702@zacarias.com.ar> <20140622224049.GF21768@free.fr>
Message-ID: <53A75D10.8050708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2014 07:40 PM, Yann E. MORIN wrote:
> Then would it make sense to package geoipudate instead, either or both
> as a target and/or a host package:
>     https://github.com/maxmind/geoipupdate
> 
>     The GeoIP Update program performs automatic updates of GeoIP2 and
>     GeoIP Legacy binary databases.
> 
> That way, the user can get it with a post-build script, and/or a
> cron-like job on the target, to be up-to-date.

Geoipupdate is for commercial users AFAIK, i have no such access/account
to test the package. You need to configure a maxmind user/password to
make it work, it's not an out-of-the-box experience.
Someone who has might be interested to make it though.
Regards.
