From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:29:44 +0200
Subject: [Buildroot] [PATCH] yasm: New package
In-Reply-To: <1344627011-1862-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1344627011-1862-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20120811222944.0b6b6ff8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 10 Aug 2012 22:30:11 +0300,
Stefan Froberg <stefan.froberg@petroprogram.com> a ?crit :

> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>

Thanks, applied to next with a few minor fixes.

Luca, I'm Cc'ing you on this regarding the license informations. The
license of Yasm seems to be, hum, complicated. Below the contents of
the COPYING file of the project. How should we encode that into
YASM_LICENSE ? :-)

----------------------------------------------------------------------
Yasm is Copyright (c) 2001-2010 Peter Johnson and other Yasm developers.

Yasm developers and/or contributors include:
  Peter Johnson
  Michael Urman
  Brian Gladman (Visual Studio build files, other fixes)
  Stanislav Karchebny (options parser)
  Mathieu Monnier (SSE4 instruction patches, NASM preprocessor additions)
  Anonymous "NASM64" developer (NASM preprocessor fixes)
  Stephen Polkowski (x86 instruction patches)
  Henryk Richter (Mach-O object format)
  Ben Skeggs (patches, bug reports)
  Alexei Svitkine (GAS preprocessor)
  Samuel Thibault (TASM parser and frontend)

-----------------------------------
Yasm licensing overview and summary
-----------------------------------

Note: This document does not provide legal advice nor is it the actual
license of any part of Yasm.  See the individual licenses for complete
details.  Consult a lawyer for legal advice.

The primary license of Yasm is the 2-clause BSD license.  Please use this
license if you plan on submitting code to the project.

Yasm has absolutely no warranty; not even for merchantibility or fitness
for a particular purpose.

-------
Libyasm
-------
Libyasm is 2-clause or 3-clause BSD licensed, with the exception of
bitvect, which is triple-licensed under the Artistic license, GPL, and
LGPL.  Libyasm is thus GPL and LGPL compatible.  In addition, this also
means that libyasm is free for binary-only distribution as long as the
terms of the 3-clause BSD license and Artistic license (as it applies to
bitvect) are fulfilled.

-------
Modules
-------
The modules are 2-clause or 3-clause BSD licensed.

---------
Frontends
---------
The frontends are 2-clause BSD licensed.

-------------
License Texts
-------------
The full text of all licenses are provided in separate files in the source
distribution.  Each source file may include the entire license (in the case
of the BSD and Artistic licenses), or may reference the GPL or LGPL license
file.

BSD.txt - 2-clause and 3-clause BSD licenses
Artistic.txt - Artistic license
GNU_GPL-2.0 - GNU General Public License
GNU_LGPL-2.0 - GNU Library General Public License
----------------------------------------------------------------------

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
