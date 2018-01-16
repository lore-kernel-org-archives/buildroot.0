From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 20:37:33 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: security bump to version
 2.18.5
In-Reply-To: <20180110135707.12108-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 10 Jan 2018 15:57:07 +0200")
References: <20180110135707.12108-1-aperez@igalia.com>
Message-ID: <87r2qpfvcy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a maintenance release of the current stable WebKitGTK+ version,
 > which contains mitigations for CVE-2017-5753 and CVE-2017-5715, the
 > vulnerabilities known as the "Spectre" attack. It also contains a fix
 > which allows building the reference documentation with newer gtk-doc
 > versions.

 > Release notes can be found in the announcement:

 >   https://webkitgtk.org/2018/01/10/webkitgtk2.18.5-released.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
