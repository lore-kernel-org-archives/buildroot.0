From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 21:27:28 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: Add Sourcery
 CodeBench for Nios-II
In-Reply-To: <CAAEAJfBsymVg-zZuJuHFSXCmdhV6X2-VXk74YC8tvwbEQ8TVwg@mail.gmail.com>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376999946-3314-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145B05.4080405@mind.be>
 <CAAEAJfBVeUKtYDwHF5=QXN6NVtPQm0c_u60qRDFbs7cUKKrbeg@mail.gmail.com>
 <5214F192.50800@mind.be>
 <CAAEAJfBsymVg-zZuJuHFSXCmdhV6X2-VXk74YC8tvwbEQ8TVwg@mail.gmail.com>
Message-ID: <521514A0.9060303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/08/13 21:23, Ezequiel Garc?a wrote:
[snip]
> Speaking of toolchains. Any recomendations on how to *choose* a toolchain?
>
> Should I safely use Sourcery?
> Should I prefer Buildroot internal (when we add support for it)?
> Which should be the rationale behind such decision? (aside from the
> fact the buildroot toolchain allows to be tuned)

  External toolchain has the advantage that you don't have to spend time 
(about an hour) on building it.

  Internal toolchain has the advantage that it is configurable, and can 
be uClibc based and therefore smaller. The difference between uClibc and 
glibc is in the order of 1MB, so it only really makes sense when you want 
a really small rootfs.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
