From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 4 Feb 2016 20:55:05 +0100
Subject: [Buildroot] Setting RGB
In-Reply-To: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
Message-ID: <20160204205505.5a842de4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gabriel Andr?s Castillo,

On Thu, 4 Feb 2016 11:28:24 -0300, Gabriel Andr?s Castillo <gcastillo@controlnet.com.ar> wrote:

> Hi, i have running my board, but the only problem are colors. I don't know
> where to configure RGB on buildroot.
> The problem is that my blue is red, and the red is blue when i run a qt5
> application.

Not much information about which board, which architecture, which display (vga, hdmi, lvds?),
which buildroot version (and which configuration file)...

Colors only wrong when using qt5 (x11, linuxfb or eglfs?)?
Try qt4, directfb etc...

Regards,
Peter

> Regards.
> 
> --
