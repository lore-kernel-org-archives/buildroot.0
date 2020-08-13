From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:31:26 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <20200813232744.12d34e1b@windsurf.home>
References: <20200808173800.2034897-1-christian@paral.in>
 <20200813232744.12d34e1b@windsurf.home>
Message-ID: <CA+h8R2qWhbuQj_weOPZk9NeR2C_9CQ1zAZfogtO69og5Eyqs5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 13, 2020 at 2:27 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat,  8 Aug 2020 10:38:00 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > Fixes compile errors against certain kernels.
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
>
> Applied to master, thanks. I have to say the snippet of code that is
> being patched here does not give a very good feel of the rtl8821au
> code base :-/

After years of struggling with USB rtl cards (and helping others do
the same) I have to agree.

Best regards,
Christian
