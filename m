From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 5 Sep 2020 12:04:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with gcc 10
In-Reply-To: <87sgbwk4iu.fsf@dell.be.48ers.dk>
References: <20200901210017.3471351-1-fontaine.fabrice@gmail.com>
 <20200904091841.4e702692@windsurf.home> <87sgbwk4iu.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W80ehyPZ02tQDy=+jtqcvEz_Ym_YNVS=TWkTcMbyX_MsYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 5 sept. 2020 ? 10:32, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Tue,  1 Sep 2020 23:00:17 +0200
>  > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
>  >> Fixes:
>  >> - http://autobuild.buildroot.org/results/8754bb4f7d749f999d5f8ddfec587470ceec4476
>  >>
>  >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  >> ---
>  >> .../minidlna/0001-fix-build-with-gcc-10.patch | 49 +++++++++++++++++++
>  >> 1 file changed, 49 insertions(+)
>  >> create mode 100644 package/minidlna/0001-fix-build-with-gcc-10.patch
>
>  > Applied to master, thanks. I suppose this fix was submitted upstream as
>  > well?
>
> Committed to 2020.08.x, thanks.
>
> If I am not mistaken, minidlna is pretty much dead upsteam.
Indeed, minidlna is dead.
However, as requested by Thomas, I created a ticket here:
https://sourceforge.net/p/minidlna/patches/183.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
