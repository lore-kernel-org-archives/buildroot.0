From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 16:56:39 +0100
Subject: [Buildroot] [PATCH v2 5/7] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.0.p1.0
In-Reply-To: <20200210155102.GA335587@p1g2.work>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-5-tuzakli.refik@gmail.com>
 <20200204231052.350677e5@windsurf>
 <CADCpmyPFFQO+0m3gK_825QHAMN18SeCOSLFFnyzswniZt5qN3Q@mail.gmail.com>
 <20200205174803.143caa52@windsurf>
 <CAMWBNu6Gnqxh+_fPzFJL6Tda3g=dWpcwkj0pH9TkPT-VutxKYQ@mail.gmail.com>
 <20200210155102.GA335587@p1g2.work>
Message-ID: <20200210165639.1719949d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 16:51:02 +0100
Gary Bisson <bisson.gary@gmail.com> wrote:

> > we don't need mesa3d to  work with opengl, opencl... if we use vivante
> > dirver by NXP. it is  closed source and has limitations.  
> 
> Yes you do need mesa3d otherwise you won't have any header and therefore
> won't be able to build anything.

If it's only for headers, don't use mesa3d, but mesa3d-headers. The
mesa3d-headers is precisely designed to provide the OpenGL/Khronos
headers for the OpenGL implementations that don't provide it.

> > > Me Thomas, or Refik ? I might have submitted some OpenGL changes a
> > > while ago, but I'm certainly not the only one.  
> 
> You Thomas, sorry for the confusion. I don't think you ever pushed the
> change as you were not happy with it at the time.
> 
> It was on http://git.free-electrons.com/, is a bootlin equivalent
> existing?

No, we closed our own repo. Do you have the details of the change you
are talking about ? I could try to see if I still have it locally.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
