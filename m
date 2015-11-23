From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2015 21:53:20 +0200
Subject: [Buildroot] No 'zip' utility?
In-Reply-To: <n2vp1a$rde$1@ger.gmane.org>
References: <n2vp1a$rde$1@ger.gmane.org>
Message-ID: <20151123195320.GW2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

On Mon, Nov 23, 2015 at 07:22:18PM +0000, Grant Edwards wrote:
> I just stumbled across the fact that there doesn't seem to be a 'zip'
> utility available either as a busybox applet or as a stand-alone
> utility with a buildroot package.  I've got a web app running on an
> ARM9 boad that allows users to PUT trees of files to my board in
> either .zip or .tar.gz archives.  When it came time to add a feature
> that required users to GET trees of files from my board, I agreed to
> also support .zip format archives (dimly assuming that since there was
> a zip, there would be an unzip).
> 
> But, though busybox has an 'unzip', it doesn't have a 'zip'.  And
> there doesn't appear to be a stand-alone 'zip' package in buildroot.
> 
> Is it just that I'm the first one dumb enough to sign up for creating
> .zip archives on an embedded linux system? Or is there some
> licensing/patent reason why creation of the .zip archives is
> unsupported?

Try the infozip package. Look under "Compressors and decompressors".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
