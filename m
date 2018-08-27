From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 27 Aug 2018 17:32:30 -0300 (BRT)
Subject: [Buildroot] Flashing EFI on internal SSD
In-Reply-To: <1535397652.local-c4538192-4736-v1.4.1-b1028ad4@getmailspring.com>
References: <1535397652.local-c4538192-4736-v1.4.1-b1028ad4@getmailspring.com>
Message-ID: <368434519.3074792.1535401950870.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "LP C" <lpdev@cordier.org>
> To: "buildroot" <buildroot@busybox.net>
> Sent: Monday, August 27, 2018 4:27:23 PM
> Subject: [Buildroot] Flashing EFI on internal SSD

> Hi,

> Simple question here. I have generated an .img file using the
> pc_x86_64_efi_defconfig. My embedded system is an Intel Computestick. Now I
> would like to flash the internal SSD drive of the computestick.
> I tried to load a live distro (ubuntu) and tried to dd's the .img directly on
> the SSD block device and rebooted. Unfortunately the system says that no boot
> device has been detected.

> Secure boot has been disabled in the bios, and UEFI is enabled.

> Any clues on this?

You must create an UEFI boot entry, either interactively via BIOS menu
(depends on the BIOS vendor), or running efibootmgr on the command line.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
