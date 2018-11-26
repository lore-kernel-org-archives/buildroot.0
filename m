From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:02:03 +0100
Subject: [Buildroot] [PATCH 1/1] samba4: fix install of systemd files
In-Reply-To: <20181124201241.31036-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 24 Nov 2018 21:12:41 +0100")
References: <20181124201241.31036-1-fontaine.fabrice@gmail.com>
Message-ID: <87mupvu38k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since version 4.8.0 and
 > https://github.com/samba-team/samba/commit/080d590de1ff9f8ebc55aeffaea8d41991466549,
 > the systemd files (nmd.service, ...) are not available in packaging/systemd

 > Indeed, they are built in bin/default/packaging/systemd

 > So use the new --systemd-install-services configure option to install
 > these files

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a09a065c523931c1892e81a99c57521fbe095d8b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
