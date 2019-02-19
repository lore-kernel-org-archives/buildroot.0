From: Artem Senichev <artemsen@gmail.com>
Date: Tue, 19 Feb 2019 11:10:12 +0300
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64 platform
In-Reply-To: <CANQCQpZCkCE1y0fzB5qKKjZ7PnVyS5XXVzOEM3DKveMXQUmsgQ@mail.gmail.com>
References: <20190218121508.htf6s7bazcggmozg@gmail.com>
 <CANQCQpZCkCE1y0fzB5qKKjZ7PnVyS5XXVzOEM3DKveMXQUmsgQ@mail.gmail.com>
Message-ID: <20190219081012.uwwbztwqv4ml6lq7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 18, 2019 at 07:57:20AM -0600, Matthew Weber wrote:
> On Mon, Feb 18, 2019 at 6:17 AM Artem Senichev <artemsen@gmail.com> wrote:
> >
> > kexec has fully support of ppc64 platform:
> > https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> > Added BR2_powerpc64 platform support.
> 
> Curious, which power arch/sub-arch are you testing?  (Power 5/6/7/8?)
> (NXP or IBM)

I have checked kexec on POWER8, Little- and Big-Endian (VESNIN
server).
Linux kernel 5.0-rc6, kexec-tools 2.0.17 (from Buildroot).

Artem
