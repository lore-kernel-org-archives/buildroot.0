From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jan 2020 20:14:17 +0100
Subject: [Buildroot] [PATCH 4/6] package/perl-sys-cpu: bump to version
 0.61
In-Reply-To: <20200124171107.26086-4-francois.perrad@gadz.org> (Francois
 Perrad's message of "Fri, 24 Jan 2020 18:11:05 +0100")
References: <20200124171107.26086-1-francois.perrad@gadz.org>
 <20200124171107.26086-4-francois.perrad@gadz.org>
Message-ID: <87y2twvf92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  .../0001-remove-extraneous-include.patch           | 14 +++++++-------
 >  package/perl-sys-cpu/perl-sys-cpu.hash             |  2 +-
 >  package/perl-sys-cpu/perl-sys-cpu.mk               |  4 ++--
 >  3 files changed, 10 insertions(+), 10 deletions(-)

Hmm, something is wrong:

Applying patch #1228959 using 'git am -3 -s'
Description: [4/6] package/perl-sys-cpu: bump to version 0.61
Applying: package/perl-sys-cpu: bump to version 0.61
Using index info to reconstruct a base tree...
error: patch failed: package/perl-sys-cpu/0001-remove-extraneous-include.patch:11
error: package/perl-sys-cpu/0001-remove-extraneous-include.patch: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.

-- 
Bye, Peter Korsgaard
