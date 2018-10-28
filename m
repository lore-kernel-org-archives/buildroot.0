From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 28 Oct 2018 12:02:00 +0100
Subject: [Buildroot] alsa-utils: alsactl services are not installed
In-Reply-To: <CANTMe2UJhVMgxj+mSX+XiNkv=Qzb6H3rQhDOphpV7=7xVB-HYw@mail.gmail.com>
References: <CANTMe2UJhVMgxj+mSX+XiNkv=Qzb6H3rQhDOphpV7=7xVB-HYw@mail.gmail.com>
Message-ID: <20181028120200.77b9aab2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello ?????,

On Thu, 25 Oct 2018 11:16:35 +0300, ????? ?????????? <prok.tim26@gmail.com> wrote:

> Hello,
> 
> I'm trying to build Buildroot with systemd. alsa-utils seem to install
> correctly but the alsa-restore and alsa-state services aren't installed to
> the target directory but to the host directory only.
> 
> It's very weird since simply copying the service files to the target
> directory and installing the resulting image works properly. Is there any
> problem with the Makefile? Using systemd v239 with alsa-utils v1.1.5

Seems no one missed the files until now ;-), try suggested patch
'[PATCH v1] alsa-utils: install systemd sevice files' (see [1])...

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/989965

> 
> Thank you in advance.
