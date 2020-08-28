From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:33:55 +0200
Subject: [Buildroot] [git commit] utils/{check-package,
 checkpackagelib}: consistently use raw strings for re.compile
In-Reply-To: <20200814195008.BC783863DF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 14 Aug 2020 21:55:59 +0200")
References: <20200814195008.BC783863DF@busybox.osuosl.org>
Message-ID: <87mu2eu3v0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=163f160a8e12e1cae4b43d7c8152d4370f12c442
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Raw strings need to be used when calling re.compile() otherwise Python
 > 3.x flake8 complains with:

 > W605 invalid escape sequence '\s'

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
