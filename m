From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Oct 2013 10:40:25 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyusb: new package
In-Reply-To: <526E1F5B.2020104@mind.be>
References: <CAMduVEegwCNSu2cBGbTOjUhBUtD5kv1F14eViyj+y9M29wwngQ@mail.gmail.com>
 <1382742325-11435-1-git-send-email-wzab01@gmail.com>
 <OF7CA7B8E3.5FD89345-ON86257C0F.0052857B-86257C0F.0054D5D3@rockwellcollins.com>
 <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382742930-11510-1-git-send-email-wzab01@gmail.com>
 <526B018E.9080206@mind.be>
 <CAMduVEc4LUGPXPoNmQR0_+pYf9_Pd2BUeFQG0xrWZyScbHJNNw@mail.gmail.com>
 <526E0E55.8060005@mind.be>
 <20131028081046.GA30640@sapphire.tkos.co.il>
 <526E1F5B.2020104@mind.be>
Message-ID: <20131028084025.GB30640@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Oct 28, 2013 at 09:24:59AM +0100, Arnout Vandecappelle wrote:
> On 28/10/13 09:10, Baruch Siach wrote:
> >On Mon, Oct 28, 2013 at 08:12:21AM +0100, Arnout Vandecappelle wrote:
> >>On 26/10/13 09:33, Wojciech Zabolotny wrote:
> >>>On Sat, Oct 26, 2013 at 1:41 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >>>>  Also, when sending an update, it is customary to add v2 to the subject
> >>>>  so
> >>>>people can see which version is the latest one. You can do that by calling
> >>>>git send-email -v2 # Since git 1.8.x
> >>>>or
> >>>>git send-email --subject-prefix='PATCH v2'
> >>>
> >>>It seems, that the above should be applied to git format-patch, not
> >>>git send-email?
> >>
> >>  You're right, but git send-email takes (almost) all of the options
> >>of git format-patch if you let it generate patches directly (e.g.
> >>with 'git send-email -1). Normally I don't bother with generating
> >>the patches separately and just mail them immediately - and I
> >>assumed that the rest of the world does the same :-).
>
> >How do you add patch version changelog then?
> 
>  Manually with git commit --amend.

But with 'commit --amend' you can only edit the log message itself, not the 
part below the '---' separator where patches changelog usually go.

baruch

>  There is no way AFAIK to ensure consistency between the patch
> changelog and the -v option you pass to send-email/format-patch.
> There are a few tools like topgit and guilt that are supposed to
> make it easier to manage a patch with changelog, but I found them
> difficult to use.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
