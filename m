From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 18 Oct 2019 11:04:34 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-10-17
In-Reply-To: <5da958ae.1c69fb81.2dda5.f40cSMTPIN_ADDED_MISSING@mx.google.com>
References: <5da958ae.1c69fb81.2dda5.f40cSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAJ4jsaeCnAFqP0k4gkrhE7VdtQbAHH7pNvJpnMMpqJYQ7CUL3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 18, 2019 at 3:16 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2019-10-17, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the '2019.08.x' branch
> ----------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arm      |      cups-filters-1.23.0       | http://autobuild.buildroot.net/results/5c88115b92abc1360a979cd46e00332f61c41cb4

Hum, it's necessary to cherry-pick
d371c8762683e430c19db3b6d14d5b6bf4fac67e to 2019.08.x.

-- 
Carlos Santos <unixmania@gmail.com>
