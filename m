From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Apr 2020 00:34:16 +0000
Subject: [Buildroot] [Bug 12751] OpenJdk package installation issues on
 target
In-Reply-To: <bug-12751-163@https.bugs.busybox.net/>
References: <bug-12751-163@https.bugs.busybox.net/>
Message-ID: <bug-12751-163-rZcRAI0tqj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12751

--- Comment #4 from Ameya <ameya.joshi@rockwellcollins.com> ---
Hi Adam,

I get error while applying the patch 

https://patchwork.ozlabs.org/project/buildroot/patch/20200417232922.3762195-4-aduskett at gmail.com/


Also i looked at the patch it replaces the existing build and install commands 
so if a user doesnt want a full JDK it wont work right?

Regards,
Ameya

-- 
You are receiving this mail because:
You are on the CC list for the bug.
