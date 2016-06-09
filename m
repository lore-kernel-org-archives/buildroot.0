From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 9 Jun 2016 17:59:35 -0400
Subject: [Buildroot] [PATCH] RFC: adding customizable linux logo
In-Reply-To: <CA+TH9V=vZLn=0ubRy7YZrXnakN_=wG2X0PfTqHEGss87ocxLFw@mail.gmail.com>
References: <1454454342-27717-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160601220300.5f38a5a2@free-electrons.com> <20160602220521.GB3714@free.fr>
 <CA+TH9V=vZLn=0ubRy7YZrXnakN_=wG2X0PfTqHEGss87ocxLFw@mail.gmail.com>
Message-ID: <CA+-urNQLEivZ6Qm6wzKYA3GNE9eEu_5aHC25Yuf9M_B1Fqfy4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo and all

On Thu, Jun 9, 2016 at 4:03 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> A little recap:
>
> a) I should rework the custom logo package and logic, no problem here.
> b) Relaying on user pre-installed imagemagick it's not allowed by
> buildroot policies but I don't want to build the complete
> host-imagemagick only for converting a ppm.
> c) IMHO, the complex part here is to convert correctly an image to a
> kernel suitable ppm (not so trivial): let a user preparing his own ppm
> it's not advisable and prone to errors.
>
> So if b) and c) are not acceptable for buildroot policies, please
> discard this patch.

I realize this is late feedback, but I actually found your patch
useful, so I'd lobby to not abandon it.

In my use, I had to remove the imagemagick call since it wasn't right
for my image (a pbm), but the rest was convenient. It beat what I
previously was doing which was turning the pbm into a kernel patch.

Regards,
Frank
