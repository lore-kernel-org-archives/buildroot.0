From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2012 07:39:34 +0100
Subject: [Buildroot] Who calls to the defined function/s
In-Reply-To: <CACUGKYNs2gHvS_6eJS22gYgZOE7rhSciSaCAeCxbEm4q5Dm=Kw@mail.gmail.com>
References: <CACUGKYMDKMSvqrUgRhiKyaVm6S5z7a+RMa+3oyCXspU8OVVbYQ@mail.gmail.com>
 <20121120095904.20264654@skate>
 <CACUGKYNs2gHvS_6eJS22gYgZOE7rhSciSaCAeCxbEm4q5Dm=Kw@mail.gmail.com>
Message-ID: <50AC7726.70607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/12 19:26, John Tobias wrote:
> I was thinking to support the package
> management in the buildroot. Where, if I define XXX_CREATE_PACKAGE in
> my hello.mk
> the buildroot (for example) will create an opkg file (off-course I
> have supply the necessary information to create the package file).
>
> I know the buildroot community did not support it package management
> but I would like to add some flexibility on my buildroot environment.

  Even though it's very likely that we will not include support for packages in
buildroot, it's worthwhile to post your patches to the list. That way, anybody
else that needs it can pick it up.  In addition, you may get some review comments
which are useful for yourself.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
