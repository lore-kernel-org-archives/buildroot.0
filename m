From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 08:04:59 +0200
Subject: [Buildroot] [PATCH 2020.02.x v2 4/4] package/systemd: Backport
 fix for makefs
In-Reply-To: <20200908221256.126984-4-brandon.maier@rockwellcollins.com>
 (Brandon Maier's message of "Tue, 8 Sep 2020 17:12:56 -0500")
References: <20200908221256.126984-1-brandon.maier@rockwellcollins.com>
 <20200908221256.126984-4-brandon.maier@rockwellcollins.com>
Message-ID: <87eenb7aes.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > The systemd fstab option "x-systemd.makefs" will fail to work, and throw
 > an error that it can't find a device named "" (an empty string).
 > Backport this fix from systemd v245.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
 > ---
 > v2:
 > - Add "backport from" and SoB

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
