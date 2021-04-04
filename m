From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 4 Apr 2021 22:50:16 +1200
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump version to 3.31.2
In-Reply-To: <87y2dyz6jh.fsf@dell.be.48ers.dk>
References: <20210329075604.12322-1-judge.packham@gmail.com>
 <87y2dyz6jh.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZC9cOM5zbVZbgFqhd1q-z6=dUi_YYHapgE6dObJvAejbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 4 Apr 2021, 10:29 PM Peter Korsgaard, <peter@korsgaard.com> wrote:

> >>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>  > https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.31.2
>  > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>  > ---
>  >  package/syslog-ng/syslog-ng.hash | 2 +-
>  >  package/syslog-ng/syslog-ng.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/syslog-ng/syslog-ng.hash
> b/package/syslog-ng/syslog-ng.hash
>  > index 60ea6b3c61..812655cd49 100644
>  > --- a/package/syslog-ng/syslog-ng.hash
>  > +++ b/package/syslog-ng/syslog-ng.hash
>  > @@ -1,5 +1,5 @@
>  >  # Locally computed
>  > -sha256
> 44e54a6186af14d01affa06bf7391cfe8fc2460bd4ba211aab5469d8b1ca5b4b
> syslog-ng-3.30.1.tar.gz
>  > +sha256
> 2eeb8e0dbbcb556fdd4e50bc9f29bc8c66c9b153026f87caa7567bd3139c186a
> syslog-ng-3.31.2.tar.gz
>  >  sha256
> e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
>  >  sha256
> ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>  >  sha256
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
>  > diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/
> syslog-ng.mk
>  > index 3c0c346563..20f5fc2235 100644
>  > --- a/package/syslog-ng/syslog-ng.mk
>  > +++ b/package/syslog-ng/syslog-ng.mk
>  > @@ -6,7 +6,7 @@
>
>  >  # When updating the version, please check at runtime if the version in
>  >  # syslog-ng.conf header needs to be updated
>  > -SYSLOG_NG_VERSION = 3.30.1
>  > +SYSLOG_NG_VERSION = 3.31.2
>
> So no need to update syslog-ng.conf?
>

Oops forgot about that. I'll send a v2 tomorrow.


> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210404/9992a049/attachment.html>
