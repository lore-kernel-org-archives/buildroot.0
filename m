From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 08:48:14 +0100
Subject: [Buildroot] [PATCH] python-pycrypto: ignore LICENSE.orig for
 the moment
In-Reply-To: <20131222210759.GI27858@free.fr>
References: <1387731898-14058-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131222210759.GI27858@free.fr>
Message-ID: <20131223084814.66cfeac7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Dec 2013 22:07:59 +0100, Yann E. MORIN wrote:

> On 2013-12-22 18:04 +0100, Thomas Petazzoni spake thusly:
> > LICENSE.orig gets removed from the source tree by the apply-patches.sh
> > script. Until this is fixed in apply-patches.sh, remove LICENSE.orig
> > from <pkg>_LICENSE_FILES to fix the autobuilder issues.
> 
> Can't we have a post-extract hook that renames that file, so we can add
> it to the legal-info?

Yes, that would be an option.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
