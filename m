From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 31 Oct 2018 22:18:53 -0700
Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
In-Reply-To: <29863682.6024437.1541037261607.JavaMail.zimbra@datacom.com.br>
References: <20181031213930.49837-1-mmayer@broadcom.com>
 <29863682.6024437.1541037261607.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAGt4E5v3LMu=tQbPNGWHwwL4P2k8iYp3WGA6OGVYc7pBwipQLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 31 Oct 2018 at 18:54, Carlos Santos <casantos@datacom.com.br> wrote:
>
> > From: "Markus Mayer" <mmayer@broadcom.com>
> > To: "buildroot" <buildroot@buildroot.org>
> > Cc: "Markus Mayer" <mmayer@broadcom.com>
> > Sent: Wednesday, October 31, 2018 6:39:30 PM
> > Subject: [Buildroot] [PATCH] Config.in: add BR2_DL_DIR_OPTS
>
> > Provide a simple mechanism to pass extra arguments to "mkdir" when
> > creating download directories. This can be helpful if one needs the
> > download directories to be writable multiple users ("shared download
>
> writable by multiple users

Thanks. I'll fix that.

> --
> Carlos Santos (Casantos) - DATACOM, P&D
