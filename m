From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 09:40:31 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
 programs
In-Reply-To: <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121129094031.3173b9a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 29 Nov 2012 00:54:02 +0100, Yann E. MORIN wrote:

> There is some (minor?) issues wrt the licensing terms.
> The libfdt library is dual-licensed GPLv2+/BSD-2c, and the
> executables are licensed GPLv2+.
> 
> There is no way in BR to properly convey this information.
> So I decided to add some explanatory comments in the .mk
> file, in retaliation. ;-)

As per the discussion during the Developers Days, there is now a way to
convey this information. From the report:

     multiple licenses: we don't want to make things very complex. It
     doesn't have to be machine-readable (we don't need to support
     machine analysis of the license field), so we don't have to
     formally decide how the license text must be written. It does make
     sense to have some convention, though. Proposal: "GPLv2+ or BSD-2c
     for the library, GPLv2+ for the dtc executable". 

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
