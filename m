From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Dec 2012 07:30:44 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <201212042310.25968.yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <201211301738.37463.yann.morin.1998@free.fr> <50BE6AF7.8090101@mind.be>
 <201212042310.25968.yann.morin.1998@free.fr>
Message-ID: <50BEEA14.6050603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/12 23:10, Yann E. MORIN wrote:
> OK, so let's first list what variables we need. I can think of at least
> these (prefix by "$(PKG)_", of coure):
>
> Variable            |  Default  | Notes
> --------------------+-----------+----------------------------------
> MAKE_CONFIG_GOAL    | (empty)   | Not used if empty (or not set?)
> MAKE_BUILD_GOAL     | (empty)   | Will call the default target of the Makefile
> MAKE_INSTALL_GOAL   | install   |
> MAKE_UNINSTALL_GOAL | uninstall |
> MAKE_CLEAN_GOAL     | clean     |
>
> I think the names are explicit enough, save for the first one. Some packages
> may require a step before the acutal build: for the Linux kernel, we need
> to make oldconfig first.
>
> Now, let's settle for a naming convention. See my proposal above.
> Anyone wants to suggest another naming scheme?

  Your proposal looks good to me!

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
