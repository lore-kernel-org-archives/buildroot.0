From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 May 2018 12:50:08 +0000
Subject: [Buildroot] [Bug 11051] runtime issue on STM32 with usage of
 binutils 2.29.x
In-Reply-To: <bug-11051-163@https.bugs.busybox.net/>
References: <bug-11051-163@https.bugs.busybox.net/>
Message-ID: <bug-11051-163-5qpWJFHCRf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11051

--- Comment #2 from Christophe Priouzeau <christophe.priouzeau@st.com> ---
Thanks for the information.

I have made the test by changing the version of binutils and we doesn't see the
issue at runtime.

I have pushed to patch for updating the configuration of stm32 on buildroot: 
patch 1: http://patchwork.ozlabs.org/patch/922037/
patch 2: http://patchwork.ozlabs.org/patch/922049/

Thanks for your help and your reactivity.
Chritophe Priouzeau

-- 
You are receiving this mail because:
You are on the CC list for the bug.
