From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 23:30:35 +0200
Subject: [Buildroot] thread debugging with target gdb
In-Reply-To: <zarafa.505a38cb.6d34.7898f54820e76f8d@jacal.basystemes.fr>
References: <505A3347.9010503@mind.be>
 <zarafa.505a38cb.6d34.7898f54820e76f8d@jacal.basystemes.fr>
Message-ID: <505A397B.80404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 23:27, Thierry Bultel wrote:
>
> Trying gdbserver is my next step, but I feel pessimistic / my conclusions above.

  Most BR developers use gdbserver only, so that's better supported than full gdb on
the target.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
