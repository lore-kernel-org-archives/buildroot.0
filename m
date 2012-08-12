From: Jonathan Liu <net147@gmail.com>
Date: Sun, 12 Aug 2012 15:06:55 +1000
Subject: [Buildroot] Open question: remove "toolchain on target" option
In-Reply-To: <20120811202114.3a95d4ab@skate>
References: <20120811202114.3a95d4ab@skate>
Message-ID: <502739EF.7070104@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A toolchain on the target is useful when you want to develop small 
libraries/applications/tests on the embedded device that you're 
targeting without having to think as much about cross compiling. The 
embedded device may be sufficiently powerful to do native development on 
in this case. If the option worked with external ctng toolchains I'd 
probably use it.

Regards,
Jonathan
