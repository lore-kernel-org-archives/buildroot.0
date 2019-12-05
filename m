From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 6 Dec 2019 01:04:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-12-04
In-Reply-To: <5de8af52.1c69fb81.e1f2d.2900SMTPIN_ADDED_MISSING@mx.google.com>
References: <5de8af52.1c69fb81.e1f2d.2900SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAMw6YJKL8jtNu650f0UAJj=7EE7MabmMcZUbBnQT24tvC6-q-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On Thu, Dec 5, 2019 at 9:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2019-12-04, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>  powerpc64   | host-gettext-tiny-73fc3e7ef... | http://autobuild.buildroot.net/results/cd87788ffea5ae6c90f4302b21ecb928b69cf334
>

looks like it is due to the missing xzcat on the build server ?

Regards,
Vadim Kochan
