From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Oct 2012 21:01:21 +0200
Subject: [Buildroot] Git download is currently broken
In-Reply-To: <CAExDhvZGg+VBSx3aP73yG8er9ppqEfL4FrmcoQbn4OT5xcVi8A@mail.gmail.com>
References: <CAExDhvZGg+VBSx3aP73yG8er9ppqEfL4FrmcoQbn4OT5xcVi8A@mail.gmail.com>
Message-ID: <507C5D81.7060109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/12 19:49, Thiago A. Corr?a wrote:
> Hi,
>
>       I've noticed that the generic-package Git download method is
> broken, but I haven't been able to figure out why. Even packages
> already included in buildroot will download from the buildroot.net
> mirror instead of git.

  Works for me (tried with can-utils).

  Can you run buildroot with 'make V=1' to see how git is called?  The
output is very difficult to parse, but somewhere in that huge shell line
there should be something like:

... git clone --bare git://... qtserial-e831107f468618881e435932c8a42404c1dde13c


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
