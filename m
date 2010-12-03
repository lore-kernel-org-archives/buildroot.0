From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Dec 2010 11:35:36 +0100
Subject: [Buildroot] DConf
In-Reply-To: <613102.68437.qm@web111103.mail.gq1.yahoo.com>
References: <613102.68437.qm@web111103.mail.gq1.yahoo.com>
Message-ID: <20101203113536.38481498@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Dec 2010 21:39:01 -0800 (PST)
Justin Mark <oilehus@yahoo.com> wrote:

> Any plan to add DConf (http://live.gnome.org/dconf) in buildroot?

I am not aware of any effort to package DConf in Buildroot at the
moment. Looking at the configure.ac, the number of dependencies seems
to be limited, so adding this package shouldn't be very difficult.

I of course encourage you to submit a patch to add this package into
Buildroot. See
http://buildroot.org/downloads/buildroot.html#autotools-tutorial for
details on how to add an autotools-based package.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
