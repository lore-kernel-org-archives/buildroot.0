From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Aug 2019 12:34:58 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/domoticz: bump to version
 0f411f781ae4fb4a82f592d38a3f40578c149533
In-Reply-To: <20190803115606.09e8faee@windsurf.home>
References: <20190803092231.2308-1-fontaine.fabrice@gmail.com>
 <20190803115606.09e8faee@windsurf.home>
Message-ID: <CAPi7W81U8-6_iXcf_bJvd-Mec3c1czD++DtH4CmKZT=-s-LOeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le sam. 3 ao?t 2019 ? 11:56, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat,  3 Aug 2019 11:22:31 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Replace first patch to fix build when using a development version
> > - Fix build with openzwave 1.6 through:
> >   https://github.com/domoticz/domoticz/commit/56d3fa099d9c98222d6cf5043891c6ba2f1df6bf
> > - Add patch to revert cmake 3.14 dependency as buildroot currently
> >   requires only 3.8
>
> But if they require it, they probably have a reason, no ?
It builds fine with host-cmake in version 3.8.2.
They bumped this requirement in
https://github.com/domoticz/domoticz/commit/4e4ee999c4b323514c0ba81ab1ff3afb10d2f1cd
without stating why they needed this bump.
As this commit is a part of a serie
(https://github.com/szczukot/domoticz/pull/23) which is also changing
the way they check the boost version
(https://github.com/szczukot/domoticz/pull/23/commits/bec760eddf7f0e3a7959a7278b275287878ac0ee),
I assume both changes are related. I'll send this patch upstream to
get their feedback.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
