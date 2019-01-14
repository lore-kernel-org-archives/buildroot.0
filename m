From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 22:34:51 +0100
Subject: [Buildroot] swupdate: requires shared library support
In-Reply-To: <CADvTj4qVV_137wwjd0uysfKp=St9tWK1giZKr_0hZdYqXpDoBA@mail.gmail.com>
References: <4e138ec5f0641da3b17aa6e8ab35e326d040cf21.1547189095.git.baruch@tkos.co.il>
 <CADvTj4qVV_137wwjd0uysfKp=St9tWK1giZKr_0hZdYqXpDoBA@mail.gmail.com>
Message-ID: <20190114223451.7aa3a17e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 01:01:11 -0700, James Hilliard wrote:
> On Thu, Jan 10, 2019 at 11:44 PM Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > Since version 2018.11 swupdate builds its lua binding as a shared
> > library unconditionally.  
> swupdate doesn't require lua so requiring static libs to build
> swupdate doesn't seem to make sense.

I guess this issue has been fixed by
https://git.buildroot.org/buildroot/commit/package/swupdate?id=b898b67209ff5c28f06d29b4e15ee671d6b64b0b.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
