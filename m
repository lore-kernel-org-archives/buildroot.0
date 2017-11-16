From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 16 Nov 2017 16:50:30 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2017-11-15
In-Reply-To: <20171116070015.DBD4B20671@mail.free-electrons.com>
References: <20171116070015.DBD4B20671@mail.free-electrons.com>
Message-ID: <1510851029.31683.28.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, 2017-11-16 at 08:00 +0100, Thomas Petazzoni wrote:
>?
> ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_f92fb57954904d55
> 839ecc7e0759f52869fb8987&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> fE&s=YR3T_mxXLqDkCWBrYCkWPkZcIItCeTYfI8mnL3siESE&e=
> ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_0d14e112d5ca94cf
> 36cbd2605d270215236ffbde&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> fE&s=_dHTQWl51LzxdleE3rcayzRk1v03T7kC6mFmqrmLj3g&e=
> ?????????arc |???????????????????????qt-4.8.7 | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_4634366b7dfea6d6
> f11ae4d4410e35beed80f9e7&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=PyZ3d9KImQtwJn7aAlpsgbrtVTFuIem1QqiTGlZkk
> fE&s=kxc6E07u2PjhognKYoc-m1pEszYqY_uZUCAsvmnnw4c&e=

All build above failed on your "gcc112" machine and we cannot reproduce the same problem locally
on CentOS 7.x machines.

I remember you mentioned one of your build servers is non-x86 machine.
Is this the one? If that's a flavour of x86 still what is its Linux distro?

BTW maybe it worth adding not only host name but its architecture and distro version in Autobuilder artifacts?

-Alexey
