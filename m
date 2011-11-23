From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 23 Nov 2011 19:24:53 +0000
Subject: [Buildroot] [PATCH] Bump version of htop to 1.0.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60DA8AE@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C60DA8AE@ex-mb1.corp.adtran.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C60DA937@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Comment on the patch change:

>>> I think it disables the "set CPU affinity" feature ("a" key)
>>> altogether. It only matters if you have multiple CPUs.

>>> -- Hisham

If this will cause problems for anyone, let me known and I'll
make a better patch (based off of the current svn version).
 
Andy
