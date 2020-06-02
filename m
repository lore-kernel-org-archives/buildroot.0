From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 08:13:39 +0200
Subject: [Buildroot] [PATCH for-master] boot/arm-trusted-firmware:
 ignore licencing check for user defined official version
In-Reply-To: <20200530170705.562604-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 30 May 2020 19:07:05 +0200")
References: <20200530170705.562604-1-romain.naour@gmail.com>
Message-ID: <87pnaidmgc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The commit [1] "licensing info is only valid for v1.4" fixed the legal-info
 > issues when a custom ATF tarball or a version from git is used.
 > But we need to ignore licencing for a used defined official ATF version.

 > Althougt the ATF version are licensed under BSD-3-Clause, the license
 > file can be updated between version (for example between v1.4 and v2.0).

 > Ignore the licencing check if the user provide a custom official version.

 > [1] d1a61703f728340ec894c367398d2a3a394a3360

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
