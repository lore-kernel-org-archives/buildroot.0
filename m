From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Feb 2012 00:15:15 +0100
Subject: [Buildroot] [PATCH 1/1] docs: Add customizing toolchain section
In-Reply-To: <1328739654-7585-1-git-send-email-s.martin49@gmail.com>
References: <1328739654-7585-1-git-send-email-s.martin49@gmail.com>
Message-ID: <201202090015.15668.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 February 2012 23:20:54 Samuel MARTIN wrote:
> 
> Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Documentation updates, we need more of those!  Thanks, Samuel.

[snip]
> +Using the internal Buildroot toolchain backend
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The internal Buildroot toolchain backend *only* allows to generate
> +*http://www.uclibc.org/[uClibc]-based toolchains*.
> +
> +However, it allows to tune major settings, such as:
> +
> +* Linux header version
> +
> +* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc])
> +
> +* Binutils, GCC, Gdb and toolchain options
> +
> +This is directly avaiblable after selecting the +Buildroot toolchain+ type in
> +the menu +Toolchain+.

Then, the toolchain can be finely tuned invoking +make uclibc-menuconfig+.

:-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
