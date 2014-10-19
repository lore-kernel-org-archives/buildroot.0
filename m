From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 22:28:18 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-cmake.mk: globally
 disable doc, examples and tests
In-Reply-To: <20141019221013.090eb47d@free-electrons.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
 <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
 <20141019221013.090eb47d@free-electrons.com>
Message-ID: <CAHXCMMKCj2PoOrL0xGPRfp=FOhZm4=tN2RdPJR9J-J=_3ro_3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sun, Oct 19, 2014 at 10:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 19 Oct 2014 20:04:37 +0200, Samuel Martin wrote:
>
>> +             -DBUILD_DOC=OFF \
>> +             -DBUILD_DOCS=OFF \
>> +             -DBUILD_EXAMPLE=OFF \
>> +             -DBUILD_EXAMPLES=OFF \
>> +             -DBUILD_TEST=OFF \
>> +             -DBUILD_TESTS=OFF \
>
> Are these options standardized by CMake, or are they just "generally"
> used by a number of packages?

Not standardized by CMake, just used by a number of packages.

>
> If not, I don't see why they should be passed by the
> CMake infrastructure.

Since we don't really care about these things, and don't want to be
bothered by failure because of these features, I think it's a way to
enforce disabling them.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


Regards,

-- 
Samuel
