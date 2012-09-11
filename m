From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 11 Sep 2012 10:29:42 +0000 (UTC)
Subject: [Buildroot] Relocate uClibc toolchain question
References: <CAJbs9BEw+45qVbj_zcy_iFj3dGbHdN772upUXFg=pDiaR7WEsw@mail.gmail.com>
Message-ID: <k2n3qm$q27$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-09-10, Rishi <rishid+mailman@gmail.com> wrote:
> Hello,
>
> I have built a uClibc toolchain using Buildroot 2012.05.
> - uClibc 0.9.33
> - gcc 4.6.x
> - C++ support
>
> The toolchain works perfectly but I want to move it from my home
> directory to a directory that can be shared with the team, like
> /opt/arm_uClibc/..

In that case, it might be easier to use Crosstool-NG to build a
toolchain.  AFAICT, the toolchains it generates can be moved anywhere
(even to different machines).  [Though I think you do need the
sysroot option when you run a relocated ctng toolchain.]

-- 
Grant
