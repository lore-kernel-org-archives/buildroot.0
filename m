From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 08:53:14 +0100
Subject: [Buildroot] freescale_imx31_3stack_defconfig fails to build
In-Reply-To: <CAOMZO5BntMxqEBPuXVs2CX2L9OWGrf-AzbsOUeDN8qqcJgS8cg@mail.gmail.com>
References: <20180304225550.74761708@windsurf.home>
 <CAOMZO5BntMxqEBPuXVs2CX2L9OWGrf-AzbsOUeDN8qqcJgS8cg@mail.gmail.com>
Message-ID: <20180305085314.3ce92959@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Mar 2018 20:21:14 -0300, Fabio Estevam wrote:

> > See:
> >
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/55306817
> >
> > Is one of you interested in maintaining/fixing this board ? If so,
> > could you fix it and also submit a patch to add yourself to the
> > DEVELOPERS file ?  
> 
> I can send a patch converting the defconfig to use a mainline kernel instead.

Would be good, thanks! Do you have a way of testing it, or you don't
have access to the HW platform ?

If nobody has access to the HW platform, I think we could just as well
drop the defconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
