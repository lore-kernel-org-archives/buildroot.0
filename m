From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 21:41:01 +0200
Subject: [Buildroot] [PATCH] qt5script: correct license information
In-Reply-To: <20180402141508.10278-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 2 Apr 2018 16:15:08 +0200")
References: <20180402141508.10278-1-arnout@mind.be>
Message-ID: <871sfpbi5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The license information in qt5script was just copied from all the other
 > qt5 modules, but it is different (and complicated).

 > - libQt5Script itself contains the third-party JavaScriptCore source.
 >   JavaScriptCore has a number of licenses: BSD-2-Clause, BSD-3-Clause,
 >   LGPL-2.0+, LGPL-2.1+. Since it is all linked together, the end
 >   result will be BSD-3-Clause or LGPL-2.1+.

 >   The different BSD licenses are all slightly different (different
 >   authors, which affects the third clause in particular). Only one
 >   separate license file is provided, so let's use that one.

 >   There is an LGPL-2.0 license file, which is slightly different from
 >   the top-level LICENSE.LGPLv21, so let's add that one as well.

 > - libQt5Script also contains Qt-specific code which is all licensed
 >   under LGPL-2.1 only. This is covered by the LICENSE.LGPLv21 file.
 >   It merges with the LGPL-2.1+ from JavaScriptCore but limits it to
 >   2.1 only.

 > - libQt5ScriptTools is a separate libary containing just the script
 >   debugger. It is covered by the usual Qt license:
 >   * LGPL-2.1 or LGPL-3.0 with exception for Qt 5.6;
 >   * LGPL-3.0 or GPL-2.0+ for Qt 5.9 (actually it is GPL-2.0 or GPL-3.0
 >     or any later version approved by the KDE Qt foundation, but let's
 >     keep it simple :-). Note that there is no LICENSE.GPLv2 provided,
 >     only LICENSE.GPLv3. Also, there is no mention of the exception in
 >     the Qt 5.9 sources, even though the LGPL_EXCEPTION.txt is still
 >     present.

 > Update the license information with all of the above. Also add hashes
 > for the new license files from JavaScriptCore.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
