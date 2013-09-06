From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 6 Sep 2013 10:28:32 +0200
Subject: [Buildroot] [RFCv1 00/11] Convert toolchain backends to
 packages to fix source/external-deps/legal-info
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHkwnC_8gMrxTO_e8y2qg=NSZV6Bb2Wb+0kP9sEHphKXJuw1NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,

Hi Thomas,

> <snip>
>
> In the long term, I'm thinking of:
>
>  (1) Making 'toolchain' a dependency of all target packages, because
>      it's really what it is.

About that i've already sent a patch "package: add toolchain
dependency to inner-generic-package:
http://patchwork.ozlabs.org/patch/237887/

I will rebase and send the patch after i sent the v3 for the top-level
parallel make.

> <snip>

Best regards
-- 
Fabio Porcedda
