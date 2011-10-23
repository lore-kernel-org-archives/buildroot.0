From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Oct 2011 14:37:55 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111021154303.43f98ccd@skate>
References: <20111017184718.71afc290@skate>
 <20111021154303.43f98ccd@skate>
Message-ID: <20111023123755.GA2455@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 21, 2011 at 03:43:03PM +0200, Thomas Petazzoni wrote:
> Le Mon, 17 Oct 2011 18:47:18 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> 
> > The current (unfinished) status of my slides is visible at:
> >   http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
> 
> First of all, I'd like to thank Peter, Baruch, Thomas, Arnout and Will
> who gave some useful comments about my slides.
> 
> At the same URL above, I have published a new version, which hopefully
> addresses your comments, and also adds some more slides on various
> topics. The slides should now, at least in terms of contents, represent
> what I had in mind for this talk.
> 
> Now, if you're still willing to spend some time on this, I'd like to
> have comments on:
>  * remaining english typos, wording improvements, etc.
>  * suggestions of additional contents/topics if there is something I
>    missed. Like if you use best practices that aren't described in
>    those slides.
> 
> Thanks again!

Two of my earlier comments still stand.

1. Slide 23: missing -e in the 'echo' command

$ echo "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0

$ echo -e "/dev/mtdblock7\t\t/applog\tjffs2\tdefaults\t\t0\t0"
/dev/mtdblock7      /applog jffs2   defaults        0   0

2. Slides 24-27: header should be "Project-specific packages (x/5)", instead 
   of "... (x/4)".  (Can't TeX do this automatically somehow?)

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
