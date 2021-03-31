From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:25:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/samba4: bump version to
 4.14.2
In-Reply-To: <20210328094554.438194-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 28 Mar 2021 11:45:54 +0200")
References: <20210328094554.438194-1-bernd.kuhls@t-online.de>
Message-ID: <87o8ezc01j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added patch to fix build error.
 > Removed patch which was applied upstream.

 > Added two options to samba4-cache.txt to fix cross build, values were
 > taken from GnuTLS source:
 > https://gitlab.com/gnutls/gnutls/-/blob/3.6.15/lib/includes/gnutls/gnutls.h.in#L180
 > https://gitlab.com/gnutls/gnutls/-/blob/3.6.15/lib/includes/gnutls/gnutls.h.in#L341

 > host-perl is now mandatory, also host-perl-parse-yapp is needed.

 > Added option to fix build without dbus, this change needed a rework of
 > the shared-modules configure option, due to this upstream commit:
 > https://gitlab.com/samba-team/devel/samba/-/commit/b6805d5e0bcf1716f87e84bcbb2fd8f93c38a8a3

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

samba 4.14.2 is a security bump, and the 4.11.x series seems to be EOL
:/

For backporting it would have been nicer to only move to 4.12.x first,
as the 4.11..4.14 changes look a bit scary.

-- 
Bye, Peter Korsgaard
