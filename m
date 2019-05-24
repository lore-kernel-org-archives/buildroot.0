From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 23:24:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump to version
 0b8feb80fdef9a415d8250bca1790b3ff23e8391
In-Reply-To: <CADvTj4oqmLMOdaj_5Ou_16Bh1goS+5YBnP_Eopuet7-LuskysQ@mail.gmail.com>
References: <20190524203541.116482-1-james.hilliard1@gmail.com>
 <20190524231309.4c7a4ec1@windsurf>
 <CADvTj4oqmLMOdaj_5Ou_16Bh1goS+5YBnP_Eopuet7-LuskysQ@mail.gmail.com>
Message-ID: <20190524232410.62e28210@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 May 2019 15:16:51 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > This "should" ? Or does it ? Could you provide more details ? This
> > would help us decide whether this update should in master or next.  
> Does, see https://github.com/umlaeute/v4l2loopback/commit/0b8feb80fdef9a415d8250bca1790b3ff23e8391

Could you comment on what are the other commits between v0.12.1 and
0b8feb80fdef9a415d8250bca1790b3ff23e8391 ? Only bug fixes, and we
should take all of them to master ? Or should we just backport the
Linux 5.1 fix ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
