From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 08:33:57 +0100
Subject: [Buildroot] [PATCH 3/3] package/webkitgtk: add option to enable
 sandboxing support
In-Reply-To: <20190920153106.2274596-4-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 20 Sep 2019 18:31:06 +0300")
References: <20190920153106.2274596-1-aperez@igalia.com>
 <20190920153106.2274596-4-aperez@igalia.com>
Message-ID: <87pngshe6y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Add an option to enable WebKit's sandbox, which uses kernel
 > namespaces to isolate the processes used for Web content rendering
 > (WebKitWebProcess) and network/disk access (WebKitNetworkProcess).

 > The reason to have an option is that it needs additional dependencies
 > (bubblewrap, xdg-dbus-proxy, libseccomp), and that some users may
 > choose to deploy alternative solutions (for example: putting all
 > of WebKit inside its own container, using systemd-nspawn or the
 > like).

 > Patch "0002-GTK-WPE-Do-not-run-the-Bubblewrap-executable-when-co.patch"
 > is imported from upstream, as it is needed to avoid trying to run
 > the "bwrap" command from the target during cross-compilation.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
