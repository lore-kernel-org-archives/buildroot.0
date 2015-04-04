From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 4 Apr 2015 19:24:58 +0200
Subject: [Buildroot] [PATCH v2] libressl: new package
In-Reply-To: <20150404165919.3569994e@free-electrons.com>
References: <1413124786-14001-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20150404165919.3569994e@free-electrons.com>
Message-ID: <CAGduivw1dhE8Lw7__nibHy=BGWUyBzoO_FziFi21EdxqA3F5fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 4, 2015 at 4:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 12 Oct 2014 16:39:46 +0200, Maxime Hadjinlian wrote:
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>> v1 -> v2:
>>     - Add INSTALL_STAGING
>
> It is more complicated than this: libressl installs the same libraries
> as openssl. So they should conflict with each other, and possibly a
> virtual package should be introduced so that all packages can build
> against either libressl or openssl depending on which one is selected.
>
> Since you have pushed again this patch since October 2014, I'll mark
> it as Changes Requested in patchwork.
Yup, I supposed I would have to do something like that, this first
patch was only to feel the water about introducing libressl (which was
not really old at that time).
Anyway, I'll remove the dust from my repository and start working on
that again !
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
