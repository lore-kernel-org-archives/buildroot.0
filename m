From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 09 Oct 2020 16:08:42 +0000
Subject: [Buildroot] [Bug 13241] CMake miss linking with pthread library
In-Reply-To: <bug-13241-163@https.bugs.busybox.net/>
References: <bug-13241-163@https.bugs.busybox.net/>
Message-ID: <bug-13241-163-7yAB6b5pkr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13241

--- Comment #3 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
I build-tested v4 (i.e.
https://patchwork.ozlabs.org/project/buildroot/patch/20201006192709.8265-2-leo at yuriev.ru/mbox/)
and every configuration is building fine with cmake 3.18.2.

I also tried to build test it with host-cmake (i.e cmake 3.15.5) and it also
seems to build fine so I don't know if there is anything that could be done on
buildroot side.

You can send a v5 with your workaround or we can also wait to see if there is
any autobuilder failures after v4 is merged.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
