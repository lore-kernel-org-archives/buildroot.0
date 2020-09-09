From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 08:04:44 +0200
Subject: [Buildroot] [PATCH 2020.02.x v2 3/4] package/systemd: Backport
 fix for network-generator
In-Reply-To: <20200908221256.126984-3-brandon.maier@rockwellcollins.com>
 (Brandon Maier's message of "Tue, 8 Sep 2020 17:12:55 -0500")
References: <20200908221256.126984-1-brandon.maier@rockwellcollins.com>
 <20200908221256.126984-3-brandon.maier@rockwellcollins.com>
Message-ID: <87imcn7af7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > The systemd-network-generator.service will fail to parse the bootarg "ip=xxx"
 > if it's missing the (optional) hostname field. Backport this fix from
 > systemd v245.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
 > ---
 > v2:
 > - Add "backport from" and SoB

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
