From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 25 Jan 2018 19:31:44 +0100
Subject: [Buildroot] [PATCH 1/1] package: Add thunderbolt-tools package
In-Reply-To: <20180125163827.zw24oxm4bgvrrcrb@comms.fi.intel.com>
References: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
 <CAGm1_kvTptVPf4TVcyKNvfFsqH8V2wG8GQ36QJJZEpHsBgZ8tA@mail.gmail.com>
 <20180125163827.zw24oxm4bgvrrcrb@comms.fi.intel.com>
Message-ID: <CAGm1_kuLX3g3Lphpno0OgzxUrXMVG0efOZRnwFb4HaG8Aubs7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 25, 2018 at 5:38 PM, Andrei Emeltchenko
<andrei.emeltchenko.news@gmail.com> wrote:
> Hi Yegor,
>
> Thanks for review,
>
> On Thu, Jan 25, 2018 at 03:19:39PM +0100, Yegor Yefremov wrote:
>> > +
>> > +THUNDERBOLT_TOOLS_DEPENDENCIES = host-pkgconf boost eudev
>>
>> Add licence info, i.e.
>> https://github.com/intel/thunderbolt-software-user-space/blob/master/COPYING
>> and SPDX type of the licence. See the manual.
>
> It is "BSD-style" ;).
>
> If I cannot get SPDX type, can I copy license file to
> package directory and specify it like:
>
> THUNDERBOLT_TOOLS_LICENSE_FILES = COPYING

Looks like BSD-3-Clause [1]

By the way the patch title should be:

thunderbolt-tools: new package

[1] https://spdx.org/licenses/BSD-3-Clause.html

Yegor
