From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Apr 2014 06:55:17 +0200
Subject: [Buildroot] [PATCH v2] libsoxr: new package
In-Reply-To: <1398720880-2424-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1398720880-2424-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <e5bf67a2-4edc-4bb1-8497-a79db3e7327f@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien Boutteville <hadrien.boutteville@gmail.com> schreef:
>Building tests fails mainly because of the cross-compilation, so they
>are disabled for the moment.
>
>Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>---
>Changes v1 -> v2:
>  - use qstrip to check BR2_ENDIAN variable (Thomas De Schampheleire)
>  - use tarball instead of the Git repository (Thomas Petazzoni)
>  - change LICENSE to LGPLv2.1+ (Thomas Petazzoni)
>  - remove blank line

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
