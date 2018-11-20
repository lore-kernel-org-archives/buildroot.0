From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 08:21:31 +0100
Subject: [Buildroot] [PATCH] package/sconeserver: Gzipstream requires
 zlib
In-Reply-To: <1542681775-28857-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 19 Nov 2018 20:42:55 -0600")
References: <1542681775-28857-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87h8gcp62s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > checking pkg-config is at least version 0.9.0... yes
 > checking for dlopen in -ldl... (cached) yes
 > checking for deflate in -lz... no
 > configure: error: library 'libz' is required

 > Resolves
 > http://autobuild.buildroot.net/results/b5e2b8635b37e6f2803a6031b154cf67685a4221

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This has already been fixed by:

https://git.buildroot.net/buildroot/commit/?id=a18eb7f785e0a92ac6245591d3dd738571533d26

-- 
Bye, Peter Korsgaard
