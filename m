From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 17:44:06 +0200
Subject: [Buildroot] [PATCH] Depend autotools targets on host-ccache
 when BR2_CCACHE is enabled.
In-Reply-To: <CAHXCMM+ho8PGrmePj9jU6vMurz1HeQXv1N99ZbLPusFJQxv4sw@mail.gmail.com>
References: <201209061737.32826.rasasi78@gmail.com>
 <CAHXCMM+ho8PGrmePj9jU6vMurz1HeQXv1N99ZbLPusFJQxv4sw@mail.gmail.com>
Message-ID: <20130526174406.30da6ad8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 26 May 2013 17:12:16 +0200, Samuel Martin wrote:

> This should not be necessary since host-ccache is added to the
> BASE_TARGETS list in the Makefile at the root of buildroot.

Maybe:

	make menuconfig
	make <somepackage>

i.e, not starting the complete build, but just the build of a given
package?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
