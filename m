From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Dec 2018 09:55:08 +0100
Subject: [Buildroot] [PATCH] pulseview: fix a build error
In-Reply-To: <20181206220904.131b49ff@windsurf>
References: <20181203143403.18506-1-brgl@bgdev.pl>
 <20181206220904.131b49ff@windsurf>
Message-ID: <CAMRc=MfFxJG1qpU2CKxz65_2AN6WTzUKsYUW=SMeo_CeHZv56g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

czw., 6 gru 2018 o 22:09 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello,
>
> On Mon,  3 Dec 2018 15:34:03 +0100, Bartosz Golaszewski wrote:
> > Add a patch that fixes a build error occuring when libsigrokdecode is
> > not selected.
> >
> > Fixes: http://autobuild.buildroot.net/results/79ed29bdd1eec9bf7cb5003202da5ceaeb8101b6/
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  ...ar-fix-build-without-libsigrokdecode.patch | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch
>
> Applied to master, thanks. I assume you have submitted this patch
> upstream ?
>

That's right.

Bart
