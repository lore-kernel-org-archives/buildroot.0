From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 5 Jan 2013 21:12:59 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <20130105183931.2046460f@skate>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
 <CAHXCMMJi+pFKA8O9MvWMu83WR0dpqRFZ2RUxx6Hjs-hxyaskdA@mail.gmail.com>
 <20130105183931.2046460f@skate>
Message-ID: <CAGduivxz+JyANWOrfogjGfk0HGtPNtWiMkmCR93M1m9n8G3xPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 5, 2013 at 6:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sat, 5 Jan 2013 16:18:34 +0100, Samuel Martin wrote:
>> > +RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
>>
>> BTW, it is possible to avoid this cleanup hook  (or at least reduce it
>> to the example source) with this patch:
>> http://code.bulix.org/3fo6ye-82780
>> and by adding "-DVMCS_INSTALL_PREFIX=/usr" to the
>> RPI_USERLAND_CONF_OPT variable.
>
> This looks good. I would really prefer to see those libs and headers
> installed in /usr, like all other libs and headers.
>
> Maxime, can you integrate Samuel's patch?
Yep, I haven't had time to test it but I will do and send my v2 when it's done.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
