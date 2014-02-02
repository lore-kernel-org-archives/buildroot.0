From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Feb 2014 17:10:04 +0100
Subject: [Buildroot] [git commit] package/joe: Add package for the JOE
 editor
In-Reply-To: <20140202144314.AB1249C730@busybox.osuosl.org>
References: <20140202144314.AB1249C730@busybox.osuosl.org>
Message-ID: <20140202171004.44f5d381@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 2 Feb 2014 15:42:46 +0100, Peter Korsgaard wrote:

> +JOE_VERSION = 3.7
> +JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
> +JOE_LICENSE = GPLv1+
> +JOE_LICENSE_FILES = COPYING

Is this really GPLv1+ ? It is indeed GPLv1, but I'm wondering about the
"+", as I haven't seen any indication in the code about this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
