From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 01 Nov 2018 14:48:04 +0200
Subject: [Buildroot] [PATCH v6 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
References: <20181026130358.11776-1-jagan@amarulasolutions.com>
 <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
Message-ID: <87k1lx6k1n.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle writes:
>  Also it isn't clear to me why the extlinux.conf is needed when we're actually
> using U-Boot, but I guess there must be a reason for it :-)

U-Boot supports extlinux.conf parsing since quite some time, under the so
call "Distro Configuration". See doc/README.distro in the U-Boot source
tree. We already have a few boards using this capability. See for
example board/asus/tinker/.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
