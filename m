From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 15 Oct 2016 15:25:09 +0000
Subject: [Buildroot] [Bug 8846] Orphaned/missing toolchain borks eclipse
	plugin
In-Reply-To: <bug-8846-163@https.bugs.busybox.net/>
References: <bug-8846-163@https.bugs.busybox.net/>
Message-ID: <bug-8846-163-mRVihnrSP6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8846

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report. However, this bug is not directly related to
Buildroot, but rather to its Eclipse plugin. Could you report it to the
Buildroot Ecplise plugin issue tracker available at
https://github.com/mbats/eclipse-buildroot-bundle/issues ?

In addition, I am not sure this can work by design. Indeed, a CDT project
definition will include a reference to the selected toolchain, which uses an
absolute path. This absolute path is relevant on the machine where the project
was created, but will not make sense on any other machine. Since I'm not an
Eclipse user, I have no idea how this is typically handled in other situations.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
