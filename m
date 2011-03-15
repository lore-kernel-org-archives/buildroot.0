From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2011 23:46:46 +0100
Subject: [Buildroot] Facing errors when building swfdec (using external
 toolchain)
In-Reply-To: <910338.67295.qm@web29006.mail.ird.yahoo.com>
References: <910338.67295.qm@web29006.mail.ird.yahoo.com>
Message-ID: <20110315234646.5f11ca74@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Daniel,

On Tue, 15 Mar 2011 10:44:11 +0000 (GMT)
Daniel Kuhne <daniel.kuhne@yahoo.de> wrote:

> Building
> swfdec using external toolchain results in erros. I did not modify the
> swfdec.mk file.

I'm not able to reproduce. swfdec builds just fine with a CodeSourcery
ARM toolchain used as an external toolchain.

So, we'll need more details :
 * Buildroot configuration
 * External toolchain used
 * Full build log

Does this problem occurs during a fresh build from scratch ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
