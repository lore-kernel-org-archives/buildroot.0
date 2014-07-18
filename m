From: Rick Taylor <tropicalstormuk@gmail.com>
Date: Fri, 18 Jul 2014 10:16:30 +0100
Subject: [Buildroot] [PATCH 2/3] Update documentation of AUTORECONF_ENV
In-Reply-To: <CAAXf6LU8To3=uAde7xyhpeW7v1_YPA3VW8pUbdRo_FGdr8H9DA@mail.gmail.com>
References: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
 <1405672963-16069-2-git-send-email-rick.taylor@cassidian.com>
 <CAAXf6LU8To3=uAde7xyhpeW7v1_YPA3VW8pUbdRo_FGdr8H9DA@mail.gmail.com>
Message-ID: <CAGKe=yvcj81KiMk4WzuG6Qqi=Su8p1TCCa-S5KcW_tqd1vAZ0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have rebased all my autoconf patches down to 1 patch file.  Hopefully I
have got the git commit message correct.

Many thanks for your patience!

Rick


On Fri, Jul 18, 2014 at 9:54 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Rick,
>
> On Fri, Jul 18, 2014 at 10:42 AM, Rick Taylor <tropicalstormuk@gmail.com>
> wrote:
> > Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
> > ---
> >  docs/manual/adding-packages-autotools.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/docs/manual/adding-packages-autotools.txt
> b/docs/manual/adding-packages-autotools.txt
> > index 3f40503..a1a4b90 100644
> > --- a/docs/manual/adding-packages-autotools.txt
> > +++ b/docs/manual/adding-packages-autotools.txt
> > @@ -121,6 +121,11 @@ cases, typical packages will therefore only use a
> few of them.
> >    automake, libtool, etc.). Valid values are +YES+ and
> >    +NO+. By default, the value is +NO+
> >
> > +* +LIBFOO_AUTORECONF_ENV+, to specify additional environment
> > +  variables to pass the 'autoreconf' program if
>
> Did you see my comment on the previous version of this patch? I think
> there is a 'to' missing here:
>
> to pass _to_ the autoreconf program
>
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140718/bf863747/attachment.html>
