From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Mar 2015 17:57:19 +0100
Subject: [Buildroot] [git commit] imlib2: bump to version 1.4.6
In-Reply-To: <20150308071605.778EE805E4@busybox.osuosl.org>
References: <20150308071605.778EE805E4@busybox.osuosl.org>
Message-ID: <CAHkwnC-3hB1juVU1TYQ8oEpq=TpEJruwiRQaXFrQwThKBtFQjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2015 at 5:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=d8be6f7bbc26640519688e359f3802daa5abde7d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Also add two upstream patch to fix a warning and a build failure of the
> version 1.4.6.
>
> Also add AUTORECONF because one patch change the file
> "src/lib/Makefile.am".
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Unfortunately in the version 1.4.6 there is a regression in
"imlib2-config" that is causing autobuild failures in directfb and
giblib pacakges...

I've sent a patch to fix that:
http://patchwork.ozlabs.org/patch/447800/

BR
-- 
Fabio Porcedda
