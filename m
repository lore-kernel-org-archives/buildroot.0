From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 26 Sep 2018 09:29:11 +0200
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
In-Reply-To: <5baaf4f15f1fe_5ea43fa0300957d02717a@ultri5.mail>
References: <CALFsTFXK+2NB0tAJEkkyGi_QgErj18fGPg5rFN0bmfvjRLtFzg@mail.gmail.com>
 <5baaf4f15f1fe_5ea43fa0300957d02717a@ultri5.mail>
Message-ID: <CAGm1_ktSpZ2idmt-ic1XFUs3C=d0ZZQxpqdg7WDoM3CT9DGJKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo, all,

On Wed, Sep 26, 2018 at 4:54 AM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Hello,
>
> + Yegor
>
> On Tue, Sep 25, 2018 at 05:12 PM, Asaf Kahlon wrote:
>
> [reordered to give context]
> > On Tue, Sep 25, 2018 at 10:56 PM Thomas Petazzoni <
> > thomas.petazzoni at bootlin.com> wrote:
> [snip]
> >> Asaf, do you think you could help in that effort, perhaps by looking at
> >> crossbar and twisted ?
> [/reordered]
>
> > Yes, I will try to fix at least on of them (hopefully) tomorrow.
>
> I am glad to hear you will work on this.
> You have more experience than me on bumping python packages.
>
> I started bumping crossbar locally but I didn't went far yet due to lack of
> time.
> Hint: start with twisted as it is a requirement for crossbar.
>
> Here is my WIP branch. It contains incomplete work (not fully tested), but if
> you see anything that you like please feel free to grab, don't need to keep any
> authorship:
> https://gitlab.com/RicardoMartincoski/buildroot/commits/python-crossbar-bump-v1

Great! Does bumping Twisted to 18.7.0 fix the async issue? The release
was made on 13. Jul and the patch fixing it was merged on 16. Jul.

Yegor
