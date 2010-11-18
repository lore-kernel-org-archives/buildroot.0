From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Nov 2010 12:23:58 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20101118122358.896E38E872@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #12 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Try changing...
SYSSTAT_CONF_OPT = --disable-man-group
to
SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
and rebuild, does it work now?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
