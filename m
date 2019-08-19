From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Sun, 18 Aug 2019 22:03:28 -0700
Subject: [Buildroot] Buildroot radxa_rock_pi4_defconfig no longer builds
In-Reply-To: <20190818215015.482a437c@windsurf.home>
References: <20190810143635.27e1b850@windsurf.home>
 <CAMty3ZCmfinZybYWeiD_eKV20uJM0B7aF9haXC9ScLbLA-BaCg@mail.gmail.com>
 <20190818215015.482a437c@windsurf.home>
Message-ID: <CA+drQ_MLaQtogkX0K9HyatjdyMLW9JBoUM-+ZStDAxbfJ_ts6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,




On Sun, Aug 18, 2019, 12:50 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jagan,
>
> On Sun, 11 Aug 2019 10:07:15 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > > You can look at
> > > http://lists.busybox.net/pipermail/buildroot/2019-February/242251.html
> > > where a previous proposal was made, and which was reviewed.
> > > Unfortunately, the author never came back with a second iteration of
> > > the patch series.
> >
> > Will check with this series and get back to you as soon as possible.
> >
> > Thanks for noticing, I thought that this was fixed before.
>
> Thanks for your feedback. Do you think you will have the chance to look
> into this this week ?
>

I will send patch this week.


Thanks,
Shyam


> I'm wondering what to do with those defconfigs in preparation for our
> 2019.08 release. I think the safest is probably to remove them, and
> reintroduce them once we have a proper solution for the arm32
> toolchain. It seems a bit late to merge a solution for this during this
> cycle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190818/f7f5c913/attachment.html>
