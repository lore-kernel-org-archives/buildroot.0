From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Apr 2020 02:31:51 +0000
Subject: [Buildroot] [Bug 12751] OpenJdk package installation issues on
 target
In-Reply-To: <bug-12751-163@https.bugs.busybox.net/>
References: <bug-12751-163@https.bugs.busybox.net/>
Message-ID: <bug-12751-163-uJukW3QbDb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12751

--- Comment #6 from Adam Duskett <aduskett@gmail.com> ---
(In reply to Ameya from comment #5)

Hi Ameya;

This patchset does two things:

1) It fixes the originally reported bug.
2) It adds a menu config item that allows you to select if you want to build
the full jdk instead of just the JRE.

If you do not select the option to build the full JDK then the JRE will be
built instead.


If you want the ability to install the full JDK on 2020.02, you will have to
apply all 4 patches to master and then backport the changes yourself to
package/openjdk on 2020.02.

Thanks!

Adam

-- 
You are receiving this mail because:
You are on the CC list for the bug.
