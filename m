From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Sep 2019 14:52:20 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/systemd: drop
 host-intltool dependency
In-Reply-To: <CAPi7W82MAEs3gSzqG49Vu3Sx3kSbOxt-3eBV51VCy327nghung@mail.gmail.com>
References: <20190812175809.27786-1-fontaine.fabrice@gmail.com>
 <5d749986d4842_b182acfecbe864c960f8@ultri5.mail>
 <CAPi7W82MAEs3gSzqG49Vu3Sx3kSbOxt-3eBV51VCy327nghung@mail.gmail.com>
Message-ID: <20190908145220.10f5f83d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Sep 2019 09:58:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Can you investigate this?  
> I think it should be fixed by adding host-gettext to
> SYSTEMD_DEPENDENCIES. Could you check if it fixes the build failure?
> I'll then send a patch.

So systemd would need host-gettext even when NLS is disabled ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
