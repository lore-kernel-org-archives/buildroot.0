From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:49:12 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: fixup RPATH for more
 systemd host binaries
In-Reply-To: <20200615222856.147762-1-nolange79@gmail.com> (Norbert Lange's
 message of "Tue, 16 Jun 2020 00:28:55 +0200")
References: <20200615222856.147762-1-nolange79@gmail.com>
Message-ID: <87zh80y2x3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > All systemd binaries depend on libsystemd-shared and need their
 > RPATH fixed. Use a glob to catch them all

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>
 > ---
 v1-> v2:
 > -   dont ignore failure from patchelf
 v2-> v3:
 > -   change back to shell loop, the wildcard gets expanded before
 >     the install step and is empty the first time
 > -   add busctl

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
