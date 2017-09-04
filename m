From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 09:07:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] webkitgtk: Add patches which allow
	building for ARMv8-A
In-Reply-To: <20170729131639.28156-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sat, 29 Jul 2017 16:16:39 +0300")
References: <20170729131639.28156-1-aperez@igalia.com>
Message-ID: <87o9qrndpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The two added patches allow building WebKitGTK+ when the compiler
 > scpecifically targets ARMv8-A, and reports as such be pre-defining
 > __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
 > pulled from the corresponding upstream bug reports and edited to
 > remove the conflicting parts which edit the ChangeLog files.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 > ---
 > Changes v2 -> v3:
 >     - Remove hunks for ChangeLog edits, which are not present in releases.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
