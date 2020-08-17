From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Aug 2020 22:42:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200813234209.3b6dd3e1@windsurf.home>
References: <20200808173800.2034897-1-christian@paral.in>
 <20200813232744.12d34e1b@windsurf.home>
 <CA+h8R2qWhbuQj_weOPZk9NeR2C_9CQ1zAZfogtO69og5Eyqs5A@mail.gmail.com>
 <20200813234209.3b6dd3e1@windsurf.home>
Message-ID: <20200817224251.3e2be53d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 13 Aug 2020 23:42:09 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 13 Aug 2020 14:31:26 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > > Applied to master, thanks. I have to say the snippet of code that is
> > > being patched here does not give a very good feel of the rtl8821au
> > > code base :-/
> >
> > After years of struggling with USB rtl cards (and helping others do
> > the same) I have to agree.
>
> And nobody ever thought of taking all these crappy out of tree WiFi
> drivers, submit them for drivers/staging/ inclusion in the upstream
> kernel, and progressively clean them up ?

For some there are already staging alternatives (see [1], [2], [3], [4], [5])...

Regards,
Peter


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/rtl8188eu
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/rtl8192e
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/rtl8192u
[4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/rtl8712
[5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/rtl8723bs

>
> Thomas
