From: David De Grave <david.degrave@mind.be>
Date: Thu, 28 Jun 2018 16:20:52 +0200
Subject: [Buildroot] [PATCH i-g-t v3 1/1] docs/manual/prerequisite.txt:
In-Reply-To: <20180626233049.34267f58@windsurf.home>
References: <20180618124816.4258-1-david.degrave@mind.be>
 <20180626233049.34267f58@windsurf.home>
Message-ID: <CAD6XyYzG-m5mqLj063YguCt0QdxYzFb50eZjxLUb_ii64FH3Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your reply and good advices.

On Tue, Jun 26, 2018 at 11:30 PM, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello David,
>
> Why does this patch has a prefix named "i-g-t" ? Are you working on
> intel-gpu-tools besides working of Buildroot ?
>

I noticed it too and didn't catch that it was due to that. Indeed, I was
working on the
intel-gpu-tools package when I switched to another branch. No idea how I
ended up
with that prefix... Will take care of this for the next time.


> ALso, the commit title is not complete, it lacks a description.
>
> > Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
> > ---
>
> ... here, so that it doesn't become part of the Git commit log once the
> patch is applied.
>

Yes.. I noticed it too but the patch was already submitted. So, I though to
wait for a reaction
before changing it. And it seems it was a good idea because, like you
pointed it out below,
I don't think anymore it's the way to go ...


> > +** +glibc.i686+ and +zlib.i686+ (Redhat/Fedora)
> > +** +libc6:i386+ and `g++-multilib` (Debian/Ubuntu)
>
> However, overall, I'm not too happy with this, because we don't tell
> the user exactly when such dependencies are needed. Isn't the check in
> support/dependencies/dependencies.sh for the availability of 32-bit
> libraries sufficient ? If it doesn't cover some cases, then it would
> perhaps be better to extend support/dependencies/dependencies.sh rather
> than having a fuzzy requirement in the documentation, where we don't
> explicitly and clearly say in which situations such or such dependency
> is necessary.
>

I'm still a beginner in buildroot and didn't know about that script, sorry
for my lack of
knowledges in this... I work hard to learn as much as I can however :-).

I'm actually looking into reproducing the error I was faced and see if I
can update that
script to output a better error with fix proposals, depending on the host
os.

I also prefer such a solution. When the problem comes, the solution is
proposed, who
make things more easy and efficient and avoid wasting time in reading some
other docs.
We read already a lot of them, if we can avoid some more. let's do it :-)


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Thanks for your feedback and have a nice day.

-- 
Cordialement,
Kind Regards,



*David De Grave*
Senior Embedded Software Developer
Gsm : +32(0)496.364.960 | Tel : +32-16-28.65.00 | Fax : +32-16-28a.65.01
Essensium-Mind <http://www.mind.be/> - Gaston Geenslaan 9, B-3001 Leuven,
Belgium
*>>> Visit our new website:* *https://www.mind.be/ <https://www.mind.be/>**
<<<*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180628/36310749/attachment.html>
