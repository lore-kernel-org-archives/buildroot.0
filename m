From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 12:21:20 +0100
Subject: [Buildroot] [PATCH] package/systemd: fix update-done service
 for read-only filesystem
In-Reply-To: <20201109230744.1034392-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 10 Nov 2020 00:07:44 +0100")
References: <20201109230744.1034392-1-romain.naour@gmail.com>
Message-ID: <87o8k0b2vj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Backport an upstream patch to fix a regresion introduced in
 > 246.5 by [1].

 > [1] https://github.com/systemd/systemd-stable/commit/8019995e9af9c6d7b5985198cedccd24eda3e26e

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981805

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
