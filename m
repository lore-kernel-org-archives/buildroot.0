From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 29 Jan 2014 10:16:52 +0100
Subject: [Buildroot] [PATCH v4 1/5] sdl: add host version
In-Reply-To: <20140128230748.65a61e66@skate>
References: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390772341-6790-2-git-send-email-maxime.hadjinlian@gmail.com>
 <20140128230748.65a61e66@skate>
Message-ID: <CAGduivwvb92qcbTwvQK13iiT2pd_ZF8_cTUM9ooAtAP9SeLe0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all
On Tue, Jan 28, 2014 at 11:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 26 Jan 2014 22:38:57 +0100, Maxime Hadjinlian wrote:
>> Host version is needed to build xbmc
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> For my curiosity, which specific SDL and SDL_image host tools are used
> by XBMC ?
This is needed by TexturePacker which is a host tool, that is used to
pack the various images (jpeg and png) found in XBMC's GUI (Since it
supports themes), it will generate a XBT file, wich will be read by
XBMC on the target to depack and display the GUI.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
