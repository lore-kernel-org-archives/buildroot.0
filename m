From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 4 May 2018 21:58:44 +0200
Subject: [Buildroot] [PATCH 1/2] qemu: bump to 2.12.0
In-Reply-To: <CAFSsvmr2SWWAeC8MtWvmFxFbZLq6=rHz-iYb1GyFz7GxGQPLVg@mail.gmail.com>
References: <20180427154055.23272-1-aduskett@gmail.com>
 <bfc190a7-fd11-67f0-ac43-52d6db711a6b@gmail.com>
 <CAFSsvmr2SWWAeC8MtWvmFxFbZLq6=rHz-iYb1GyFz7GxGQPLVg@mail.gmail.com>
Message-ID: <76b47e72-8207-edc9-9289-a9eed234d83d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

Le 02/05/2018 ? 15:21, Adam Duskett a ?crit?:
> Hey Romain;
> 
> On Tue, May 1, 2018 at 10:58 AM Romain Naour <romain.naour@gmail.com> wrote:
> 
[...]
> 
>> Note that Qemu 2.12 has deprecated SDL support in favor of 2.0 series [2].
>> Maybe it's time to switch to SDL2.
> 
>> Best regards,
>> Romain
> 
> While it's true that it deprecated support for SDL in favor of 2.0, I would
> disagree with removing
> SDL support AND updating in a single patch. Also, even though it's
> deprecated, it still works.

Agree, the SDL support must be updated in a followup patch if you want to do
that in this series.

Best regards,
Romain

> 
> Thanks!
> Adam
