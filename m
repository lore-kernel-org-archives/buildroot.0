From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Apr 2014 20:44:57 +0200
Subject: [Buildroot] Two stages compilation
In-Reply-To: <CA+TH9VmbVayiELjF9FaMDBBE9tJvgBy8b2CUovg74b4qh4nBNA@mail.gmail.com>
References: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
 <535F8499.8070406@gmail.com>
 <CA+TH9VmbVayiELjF9FaMDBBE9tJvgBy8b2CUovg74b4qh4nBNA@mail.gmail.com>
Message-ID: <CAAXf6LVtAuS4DHWH9B-HtMcL-H6JszDsA2853c6FpM2Pu50WbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo, Zoltan,

(please don't top-post)

On Wed, Apr 30, 2014 at 9:30 AM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Hi Zoltan,
>
> Thank you very much for the info, I'm reading the documentation avidly
> but I totally missed that option.
>
> Could you please send me the package definitions you mentioned above
> as an example?
>
> Thank you!
>
> 2014-04-29 12:53 GMT+02:00 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>:
>> Dear Angelo,
>>
>> The point is here that for mono you have to define both a host package,
>> and a target package. For this you can look for the
>> "host-autotools-package" macro, and probably can get some ideas from
>> checking package/python/python.mk.
>>
>> A couple of months back i was able to package mono for OpenWrt (which is
>> in this sense close to Buildroot), but i haven't finalized that project
>> (as it turned out that the target MIPS CPU is not totally supported by
>> Mono...). If you think it's useful, i can dig this out from the archive
>> and share the package definition with you. Please let me know if so.

Note that Alexander Varnin has submitted a patch to the list for the
mono runtime a while back:
http://patchwork.ozlabs.org/patch/299488/

Best regards,
Thomas
