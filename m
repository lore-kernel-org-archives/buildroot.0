From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 23 Apr 2020 07:38:18 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ncurses: bump to version
 6.2
In-Reply-To: <20200421232618.18245478@windsurf.home>
References: <20200229232016.4174325-1-aduskett@gmail.com>
 <20200421232618.18245478@windsurf.home>
Message-ID: <CAAXf6LUZr9SxjoQeTrfxmOqOEKqFtBh1o+AprOSQeuoHOKEDRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 21, 2020, 23:26 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> +Thomas DS, since he added all the patches for ncurses 6.1
>
> On Sat, 29 Feb 2020 15:20:15 -0800
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Other changes:
> >   - Update hash for the license file due to copyright year changes.
> >   - Remove patches that are incorporated in this version.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> But then, shouldn't we add all of the ncurses-6.2 patches available at
> https://invisible-mirror.net/archives/ncurses/6.2/. I remember Thomas
> DS discussed ncurses patches during the latest Buildroot meeting, and a
> number of them (at least for ncurses 6.1) contained security fixes.
>

Yes, unfortunately the patches themselves do not always clearly indicate
whether it's the case.

Are there already any CVEs for ncurses 6.2?

From my perspective, if the 6.2 code includes the CVE fixes of 6.1, and
there are no new CVEs, then no additional patches are needed now.


> It's not clear what those patches are though, as they seem to contain
> also the 6.1 -> 6.2 changes.
>

Yes, the first patch is normally the upgrade to 6.2. This was similar in
6.1.

Thanks
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200423/a3f24efe/attachment.html>
