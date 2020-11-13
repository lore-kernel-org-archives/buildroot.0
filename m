From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 14:52:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: link with libatomic
 if needed
In-Reply-To: <20201112202202.661849-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 12 Nov 2020 21:22:02 +0100")
References: <20201112202202.661849-1-fontaine.fabrice@gmail.com>
Message-ID: <87ima9gy99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build of suricata 6.0.0 with mips32r6
 > app-layer-ftp.o: In function `FTPCheckMemcap':
 > app-layer-ftp.c:(.text+0x284): undefined reference to `__atomic_load_8'
 > app-layer-ftp.c:(.text+0x2d8): undefined reference to `__atomic_fetch_add_8'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f574005204905250702df32b61c85d427ab4feda

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
