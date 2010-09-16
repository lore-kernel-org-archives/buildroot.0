From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 16 Sep 2010 21:57:58 +1000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W14BE5B1259FD7FD3BF9A8E827A0@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	<20100913102031.03481d63@surf>
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
	<20100915133124.604f8b74@surf>
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
	<20100915190725.459aaca8@surf>
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
	<1284627065.4173.2221.camel@station1.ormlab.com>
	<SNT119-W38B5142DB23D37AEB445A827A0@phx.gbl>
	<233D327176C4471A9A40B36BC1B4EB35@AP366>
	<SNT119-W14BE5B1259FD7FD3BF9A8E827A0@phx.gbl>
Message-ID: <AANLkTinRm_mY0wWuLrzZn=wsKo39US11F36v5hgjH_MM@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 16, 2010 at 9:14 PM, Johnny Beardsmore <jny0@hotmail.com> wrote:
> I'm definitely only working with one rw partition.? It seems the two
> partition idea would be my best way forward at this stage.? I'll figure this
> out and see it it resolves my problem.

You could ask GRUB to load a RAM disk.  The programs in the RAM disk
could do the image copying to the flash FS.  After the copy, the flash
FS can be mounted, and a "pivot" done across to it.  Then the RAM disk
could be thrown away.

Just a thought...

Mitch.
