From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 14:31:15 +0100
Subject: [Buildroot] [PATCH] Revert "package/openvpn: bump version to
	2.3.10"
References: <1454246790-8381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <3ue1ocx40l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 31 Jan 2016 10:26:30 -0300 schrieb Gustavo Zacarias:

> openvpn 2.3.10 doesn't work with polarssl 1.2.x, hence this bump breaks
> builds for the polarssl backend.

Hi,

what about bumping polarssl to 1.3?

Regards, Bernd
