From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jul 2010 11:44:38 +0200
Subject: [Buildroot] QSound
In-Reply-To: <AANLkTimNs2jP4EzQhA7XwVVXvXaRTI-FhTbKvnxgqSuj@mail.gmail.com>
References: <AANLkTimNs2jP4EzQhA7XwVVXvXaRTI-FhTbKvnxgqSuj@mail.gmail.com>
Message-ID: <20100705114438.42654139@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 4 Jul 2010 14:29:40 +0300
Mahmoud Mamdouh <mamdouh.al.shamy@gmail.com> wrote:

> can't load library 'libQtMultimedia.so.4

There is a bug in Buildroot 2010.05: Buildroot doesn't copy the
libQtMultimedia library to the target when BR2_PACKAGE_QT_MULTIMEDIA is
enabled. This bug is already fixed in the development tree and the fix
will be part of the next 2010.08 release.

In the mean time, you can apply commit
79ec8e88f3a5afacff27e8eb94a5aeda17cf734a to your tree to fix the issue.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
