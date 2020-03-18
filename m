From: Carlos Santos <unixmania@gmail.com>
Date: Wed, 18 Mar 2020 07:54:43 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-03-17
In-Reply-To: <5e71cd13.1c69fb81.7eae2.2fb9SMTPIN_ADDED_MISSING@mx.google.com>
References: <5e71cd13.1c69fb81.7eae2.2fb9SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <CAJ4jsacPdi1GCfTaN3T3o78p0rkCY7CbsvVeAMDupEOhw2Xy6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2020 at 4:26 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Recent build failures and runtime-tests failures
> ================================================
>
> This is the list of Buildroot build failures that occurred on
> 2020-03-17, and for which you are a registered architecture developer,
> package developer or defconfig developer. This list also include
> runtime tests failures. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the '2019.11.x' branch
> ----------------------------------
>
> Build failures related to your packages:
>
>     arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
> powerpc64le  |       util-linux-2.35.1        | http://autobuild.buildroot.net/results/1ab31241173ac4d37d80e708113ad9ae3cf1c283
>   riscv64    |       util-linux-2.35.1        | http://autobuild.buildroot.net/results/5499240207c7fd864c6748b6f10a8a7640cabed6

This requires cherry-picking commit e02356ebb70bb17848147e0e6161eacf8526189c.

It would also be good to pick 94784f092b021af29b9480b66cd167d175b0f16b.

-- 
Carlos Santos <unixmania@gmail.com>
