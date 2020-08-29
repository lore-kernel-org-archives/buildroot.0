From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 18:35:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: disable audit for host
 package
In-Reply-To: <20200829135941.1862456-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 15:59:41 +0200")
References: <20200829135941.1862456-1-fontaine.fabrice@gmail.com>
 <20200829135941.1862456-2-fontaine.fabrice@gmail.com>
Message-ID: <87wo1hh0k3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable audit for host package to avoid getting the following error if
 > it is found on host:

 > [84/662] Generating audit_type-list.txt with a meson_exe.py custom command
 > In file included from <command-line>:32:
 > ./../src/basic/missing_audit.h:7:10: fatal error: libaudit.h: No such file or directory
 >     7 | #include <libaudit.h>
 >       |          ^~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/67782c225c08387c1bbcbea9eee3ca12bc6577cd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
