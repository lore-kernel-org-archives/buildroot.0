From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Aug 2017 09:09:10 +0300
Subject: [Buildroot] [PATCH] transmission: fix build without gtk and NLS
 disabled
In-Reply-To: <bs7q6exliu.ln2@ID-313208.user.individual.net>
References: <dff988c0638beda054e9b28be05fbdbe0140ccf9.1503289636.git.baruch@tkos.co.il>
 <bs7q6exliu.ln2@ID-313208.user.individual.net>
Message-ID: <20170821060910.7wibwyc2pm6oucmz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Mon, Aug 21, 2017 at 07:32:27AM +0200, Bernd Kuhls wrote:
> Am Mon, 21 Aug 2017 07:27:16 +0300 schrieb Baruch Siach:
> > The transmission configure script uses with/without instead of
> > enable/disable to control GTK support. So gtk support was never really
> > disabled. That broke the build when transmission happened to build after
> > libgtk3 with NLS disabled.
> 
> a patch like yours is already available:
> http://patchwork.ozlabs.org/patch/786301/

What is blocking that patch?

Anyway, I marked this one as rejected.

Do you plan to update the gtk dependency to gtk3?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
