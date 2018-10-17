From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Oct 2018 06:57:51 +0000
Subject: [Buildroot] [Bug 11401] Impossible do build a qt program using
 kf5-networkmanager-qt with qmake
In-Reply-To: <bug-11401-163@https.bugs.busybox.net/>
References: <bug-11401-163@https.bugs.busybox.net/>
Message-ID: <bug-11401-163-24h9YTCAbl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11401

--- Comment #8 from Nicolas Carrier <carrier.nicolas0@gmail.com> ---
Sure, no problem, and in the meantime, I have to consider all the solutions.

I'd really like to propose a patch directly, but I don't have a sufficient
knowledge in qmake.

I noticed that qt_lib_network.pri has its QT.network.includes variable
parametered with $$QT_MODULE_INCLUDE_BASE, when for NetworkManagerQt, it's
just:

QT.NetworkManagerQt.includes = /usr/include/KF5/NetworkManagerQt

Maybe something analogous should be done. But how ? As a buildroot patch ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
