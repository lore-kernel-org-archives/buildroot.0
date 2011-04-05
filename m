From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Apr 2011 21:56:06 +0200
Subject: [Buildroot] Installing native toolchain to target with
 Crosstool-NG
In-Reply-To: <4D9ACA75.8040203@linux-ink.ru>
References: <4D9ACA75.8040203@linux-ink.ru>
Message-ID: <20110405215606.2dbb6c88@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 05 Apr 2011 11:53:25 +0400
"a.dobrov" <a.dobrov@linux-ink.ru> wrote:

> I need to have the development environment (cross-native toolchain?)
> on the target with glibc. How to do it in Buildroot with Crosstool-NG 
> toolchain?

As of today, as far as I know, nobody as ever worked on native
toolchain support when the CT-NG backend or the external toolchain
backend are used.

Generally speaking, our support for the native toolchain (i.E toolchain
inside the target) is not really good, as Buildroot is meant to be a
cross-compiling environment, so compiling on the target shouldn't be
needed.

Of course, improvements in this area are welcome.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
