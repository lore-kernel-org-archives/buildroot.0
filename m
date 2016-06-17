From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jun 2016 07:32:49 +0300
Subject: [Buildroot] [PATCH 1/1] taskd: support linking against static
 gnutls and uuid
In-Reply-To: <20160617042418.GA26117@bronto-burt.dev.benboeckel.net>
References: <20160617020836.9765-1-mathstuf@gmail.com>
 <20160617032230.GR2749@tarshish>
 <20160617042418.GA26117@bronto-burt.dev.benboeckel.net>
Message-ID: <20160617043249.GS2749@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

On Fri, Jun 17, 2016 at 12:24:18AM -0400, Ben Boeckel wrote:
> On Fri, Jun 17, 2016 at 06:22:30 +0300, Baruch Siach wrote:
> > But you do need to sign-off if you want Buildroot to apply this patch.
> 
> Is the signoff on the buildroot-level patch not sufficient? The patch in
> question here does not modify buildroot code, but taskwarrior code.

Yes. See 
http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
