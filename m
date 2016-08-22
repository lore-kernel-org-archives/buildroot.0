From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Aug 2016 23:15:35 +0200
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to 6.2.0
In-Reply-To: <1471896123-31759-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 22 Aug 2016 17:02:03 -0300")
References: <1471896123-31759-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fb8o688.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Adjust some patches to avoid patching the ChangeLog which isn't quite
 > the same.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Is this against next? It doesn't apply for me:

Applying: gcc: bump 6.x series to 6.2.0
Using index info to reconstruct a base tree...
A       package/gcc/6.1.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
A       package/gcc/6.1.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
A       package/gcc/6.1.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
M       package/gcc/Config.in.host
M       package/gcc/gcc.hash
Falling back to patching base and 3-way merge...
Auto-merging package/gcc/gcc.hash
Auto-merging package/gcc/Config.in.host
CONFLICT (content): Merge conflict in package/gcc/Config.in.host

-- 
Bye, Peter Korsgaard
