From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 May 2013 11:58:38 +0200
Subject: [Buildroot] [PATCH v2 2/3] configs: add defconfig for Telit
 EVK-PRO3
In-Reply-To: <CAHkwnC8SPRb-3DTAx=V5a1WJN+XXr4prJsYQRebFRh3tmmObbw@mail.gmail.com>
References: <1366184503-16875-1-git-send-email-fabio.porcedda@gmail.com>
 <1366184503-16875-3-git-send-email-fabio.porcedda@gmail.com>
 <20130501231316.35d6652f@skate>
 <CAHkwnC8SPRb-3DTAx=V5a1WJN+XXr4prJsYQRebFRh3tmmObbw@mail.gmail.com>
Message-ID: <20130502115838.35737a6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 2 May 2013 00:14:49 +0200, Fabio Porcedda wrote:

> > That's quite a number of patches. I suppose they are all already
> > upstream, correct? If so, then maybe using a Git version would
> > allow to get rid of those patches in Buildroot, and then you could
> > later on submit a patch to update Barebox to the next stable
> > version that contains those patches? Maybe even Barebox 2013.05
> > will be released soon with those patches?
> 
> Unfortunately they are not upstream, the original author is still
> working on it. If possible I will try to help the original author,
> but i don't know when those patches will be
> included upstream.
> Anyway If using a git version is the preferred solution,
> I will create and use a git repostiory on github.com.

No, in this case, keeping patches is preferred, until they get merged
upstream.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
