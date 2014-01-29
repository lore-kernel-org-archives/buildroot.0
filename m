From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 08:40:43 +0100
Subject: [Buildroot] Configuring the gpsd package
In-Reply-To: <858B5C1843112849BC285F6BF91A22640EB329A5@VF2WDEXMB1.verifone.com>
References: <858B5C1843112849BC285F6BF91A22640EB1BADB@VF2WDEXMB1.verifone.com>
 <20140102080145.GL6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BB09@VF2WDEXMB1.verifone.com>
 <20140102084544.GN6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBA1@VF2WDEXMB1.verifone.com>
 <20140102100454.GS6589@tarshish>
 <858B5C1843112849BC285F6BF91A22640EB1BBD1@VF2WDEXMB1.verifone.com>
 <858B5C1843112849BC285F6BF91A22640EB2B042@VF2WDEXMB1.verifone.com>
 <20140106155637.GA4503@tarshish> <20140128183340.410169ce@skate>
 <20140128190725.GD5596@tarshish> <20140128204214.72bfe227@skate>
 <858B5C1843112849BC285F6BF91A22640EB329A5@VF2WDEXMB1.verifone.com>
Message-ID: <20140129084043.74f60588@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gabi Kelemen,

On Wed, 29 Jan 2014 07:31:53 +0000, Gabi Kelemen wrote:

> Currently it seems to work, I am able to build and the gpsd works well.
> After ignoring both dependencies: BR2_USE_MMU , BR2_TOOLCHAIN_HAS_THREADS, the package was successfully built and I was able to see and check it under menuconfig.

Ignoring dependencies seems completely wrong, but again since you're
using a really old Buildroot version, and you don't want to share your
changes and details, there's no much we can do to help you.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
