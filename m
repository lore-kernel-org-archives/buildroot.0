From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 18 Jun 2012 14:59:36 -0400
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <CADiAo4K46d1ztgeg-6k-mZaj7oohsT5MdPZLEfiQC++r6yC2dw@mail.gmail.com>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
 <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
 <4FDF24E2.6020603@free-electrons.com>
 <20120618152138.056695e303d6688dd90bba87@kinali.ch>
 <CADiAo4K46d1ztgeg-6k-mZaj7oohsT5MdPZLEfiQC++r6yC2dw@mail.gmail.com>
Message-ID: <CADiAo4LGUmUUjsq7VtWLEiX5KXPrcEasGJqvHSHgE+xxbqnGMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jun 18, 2012 at 9:32 AM, Dmitry Golubovsky <golubovsky@gmail.com> wrote:

>
> I'll try to look into their source tree as well to see if this has
> been addressed there, and maybe will try to propose a fix for
> upstream, however local patching might be a faster solution
> (unfortunately).

From the quick look at the repo [1] it seems like after v44 they
completely reorganized the sources (and integrated udev): the
offending file mount-setup.c is now in src/core (but %ms is still
there).

Why was version 44 selected for Buildroot rather than any later
version - just to avoid conflict with already included udev?

Thanks.

[1] http://cgit.freedesktop.org/systemd/systemd/tree/src?id=v185 (v185
is the last recorded tag)

-- 
Dmitry Golubovsky

Anywhere on the Web
