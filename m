From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Sat, 16 Nov 2019 13:59:36 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191115235121.531a0e36@windsurf.home>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
 <20191112220534.531a470f@windsurf>
 <CAJX3zAuwNz7zzdrxupT+o_ZWR7AYRrk6h1XpRuYHk778pMU0ZQ@mail.gmail.com>
 <20191115220834.56a3e732@windsurf.home>
 <CAJX3zAv9dAhtoiAUn-5sRFE1QOMWKK_G8P6yD1wqK25hpkq=hA@mail.gmail.com>
 <20191115235121.531a0e36@windsurf.home>
Message-ID: <CAJX3zAu7OnUt9g0xdQg6-KJckYo+iW=b36MxxvXFKyJOwS5t8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 16, 2019 at 12:51 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> So, the qemu build system requires having an interpreter called "python" ?
>

Yes.
But now I see that I can pass --python to the configure script with
the path to the interpreter, so I can simply pass $(HOST_DIR)/bin/python3
and
be done with it...
One less package depending on host-python(2).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191116/9e191f39/attachment.html>
