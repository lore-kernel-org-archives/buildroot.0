From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Dec 2012 09:19:19 +0100
Subject: [Buildroot] [PATCH RFC 5/6] libfslcodec: new package
In-Reply-To: <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
 <1355960256-10786-6-git-send-email-arnout@mind.be>
 <653065179.1471991.1355965563202.JavaMail.root@advansee.com>
Message-ID: <50D2CA07.1060503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/12 02:06, Beno?t Th?baudeau wrote:
>> >  +# FIXME The Makefile installs both the arm9 and arm11 versions of
>> >  the
>> >  +# libraries, but we only need one of them.
>> >  +
>> >  +$(eval $(autotools-package))
> For packages like this one that install pre-built libraries, it would be good to
> document somewhere or to auto-check (e.g. with toolchain kconfig options vs.
> package kconfig options) the ABI compatibility to make sure that there won't be
> any issue with the toolchain used.

  I agree, but how?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
