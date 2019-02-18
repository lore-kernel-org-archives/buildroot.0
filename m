From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 18 Feb 2019 07:57:20 -0600
Subject: [Buildroot] [PATCH] package/kexec: enable powerpc64 platform
In-Reply-To: <20190218121508.htf6s7bazcggmozg@gmail.com>
References: <20190218121508.htf6s7bazcggmozg@gmail.com>
Message-ID: <CANQCQpZCkCE1y0fzB5qKKjZ7PnVyS5XXVzOEM3DKveMXQUmsgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Artem,


On Mon, Feb 18, 2019 at 6:17 AM Artem Senichev <artemsen@gmail.com> wrote:
>
> kexec has fully support of ppc64 platform:
> https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> Added BR2_powerpc64 platform support.

Curious, which power arch/sub-arch are you testing?  (Power 5/6/7/8?)
(NXP or IBM)

>
> Signed-off-by: Artem Senichev <artemsen@gmail.com>

Looks like when the arch were last adjusted for support, powerpc64 was
just left off the list but mentioned as a supported. (Commit:
3116742e8f0c45e5ca06b32f91e481763356e03e)

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
