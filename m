From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Apr 2021 18:12:09 +0000
Subject: [Buildroot] [Bug 13771] package htop has undeclared dependency on
 host python
In-Reply-To: <bug-13771-163@https.bugs.busybox.net/>
References: <bug-13771-163@https.bugs.busybox.net/>
Message-ID: <bug-13771-163-WQbLvVPfXc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13771

--- Comment #2 from Anders F Bj?rklund <anders.f.bjorklund@gmail.com> ---
Yes, this was against LTS 2020.02.12 - should have stated that more clearly.

Did a workaround of installing "make host-python" first, before "make":
https://github.com/kubernetes/minikube/commit/b0414fc53f1e41feca2b256bf09fa3905f34078a

Have added an item to the backlog, about upgrading the OS to LTS 2021.02.x

-- 
You are receiving this mail because:
You are on the CC list for the bug.
