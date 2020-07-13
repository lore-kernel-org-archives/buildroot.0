From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 09:06:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/dbus: security bump to version
 1.12.18
In-Reply-To: <20200614194401.676838-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Jun 2020 21:44:01 +0200")
References: <20200614194401.676838-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo37ki5r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-12049: An issue was discovered in dbus >= 1.3.0 before
 >   1.12.18. The DBusServer in libdbus, as used in dbus-daemon, leaks file
 >   descriptors when a message exceeds the per-message file descriptor
 >   limit. A local attacker with access to the D-Bus system bus or another
 >   system service's private AF_UNIX socket could use this to make the
 >   system service reach its file descriptor limit, denying service to
 >   subsequent D-Bus clients.
 > - Also update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
