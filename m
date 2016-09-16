From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Sep 2016 13:28:44 +0000
Subject: [Buildroot] [Bug 8916] LDFLAGS pass to openssh
In-Reply-To: <bug-8916-163@https.bugs.busybox.net/>
References: <bug-8916-163@https.bugs.busybox.net/>
Message-ID: <bug-8916-163-pK78fWCLOR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8916

--- Comment #2 from Timur Mustafin <yxygyxyg@gmail.com> ---
I thought that BR2_TARGET_LDFLAGS option should be pass to the linker when
building any package. As it is mentioned in menuconfig's help:
"BR2_TARGET_LDFLAGS:
Extra options to pass to the linker when building for the target.".
In case of openssh package the option is not passed to the linker.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
