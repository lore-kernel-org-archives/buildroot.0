From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 6 Jun 2013 10:32:27 +0800
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <20130603113857.0c7ff74a@skate>
References: <20130529213510.43fc1372@skate>
 <CAJxxZ0MzWeQ4USQbwNwAuxGpkvwcejqaZvC7bGpySrZCdzus+g@mail.gmail.com>
 <20130603113857.0c7ff74a@skate>
Message-ID: <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 3, 2013 at 5:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Mon, 3 Jun 2013 17:26:08 +0800, Sonic Zhang wrote:
>
>> For historic reasons, Blackfin GNU toolchain generate assembly symbols
>> with the prefix '_'. For example: _uconvmsg_dat and _icudt48_dat .
>> But, the pkgdata tool in icu doesn't generate assembly file
>> uconvmsg_dat.s and icudt48l_dat.s in this way when Blackfin GNU
>> toolchain is used. What do you think is a better way to fix it?
>
> Can this specific behavior of the Blackfin toolchain be detected? Is
> there a typical autotools test that would allow to test this?
>

Maybe you can check the symbol name after compiling a C file into an
assembly file?

Regards,

Sonic
