From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:22:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to version
 6.0.9
In-Reply-To: <20201114144847.373915-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 14 Nov 2020 15:48:47 +0100")
References: <20201114144847.373915-1-fontaine.fabrice@gmail.com>
Message-ID: <8736193skx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This release fixes a potential heap overflow when using a heap allocator
 > other than jemalloc or glibc's malloc. See:
 > https://github.com/redis/redis/pull/7963

 > https://raw.githubusercontent.com/redis/redis/6.0/00-RELEASENOTES

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x, thanks.

For 2020.02.x I have instead bumped to 5.0.10, which contains the same
fix.

-- 
Bye, Peter Korsgaard
