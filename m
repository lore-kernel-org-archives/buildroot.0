From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue, 8 Oct 2013 10:52:22 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-userland: needs threads
In-Reply-To: <20131008104730.75f1bcbd@skate>
References: <1381221408-15700-1-git-send-email-phil@zankapfel.net>
 <20131008104730.75f1bcbd@skate>
Message-ID: <CAPiYbRJetVJvLTWiw757F6xHUE6jjO17bqjHo55vdK_7bMhkrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 October 2013 10:47, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Phil Eichinger,
>
> On Tue,  8 Oct 2013 10:36:48 +0200, Phil Eichinger wrote:
> > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> > ---
> >  package/rpi-userland/Config.in |    5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> Thanks. Not sure how you found this, but note that it is also fixes an
> autobuilder failure:
>
>
> http://autobuild.buildroot.net/results/c3b4c09edee2499e811808018be1858bdee70436/
>

I thought I was referencing that in the commit message, but somehow it got
lost.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131008/4db3a1cc/attachment.html>
