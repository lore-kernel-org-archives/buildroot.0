From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 23 Jul 2020 16:44:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny.hash: remove hash
 value for gettext-gnu
In-Reply-To: <20200723162557.637cb778@windsurf.home>
References: <20200722145417.2195-1-heiko.thiery@gmail.com>
 <20200723162142.2aca3ea9@windsurf.home>
 <20200723162557.637cb778@windsurf.home>
Message-ID: <CAEyMn7ZQ7eBp-aTkV7MWPm9z5_k9p01TLCM5okkykObG=Pg_GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Do., 23. Juli 2020 um 16:25 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Thu, 23 Jul 2020 16:21:42 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > I don't think gettext-tiny can build after you apply this change, it
> > should complain that one file that it downloads does not have a hash.
> > Are you sure you tested this ? If you did, then we have a bug in
> > Buildroot :-)

Sorry for that .. indeed I did not check that it builds. I faced this
after doing the bump and the check ;-/

>
> There's no bug in Buildroot, it really fails:
>
> ERROR: No hash found for gettext-0.20.1.tar.xz
> make: *** [package/pkg-generic.mk:171: /home/thomas/projets/buildroot/output/build/host-gettext-tiny-0.3.2/.stamp_downloaded] Error 1
>
> Thomas

-- 
Heko
