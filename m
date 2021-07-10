From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Jul 2021 19:22:54 +0200
Subject: [Buildroot] [PATCH] package/gawk: create awk symlink for
 host-gawk
In-Reply-To: <20210615140302.2485993-1-hubert.lacote@gmail.com> (Hubert
 Lacote's message of "Tue, 15 Jun 2021 16:03:02 +0200")
References: <20210615140302.2485993-1-hubert.lacote@gmail.com>
Message-ID: <87im1iytg1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hubert" == Hubert Lacote <hubert.lacote@gmail.com> writes:

 > From: Hubert Lacote <hubert.lacote@youview.com>
 > This is to make sure that host packages that depend on `host-gawk` and that use
 > `awk` end up using `gawk`, instead of the `awk` symlink installed on the host
 > system.

 > On recent Debian-based distributions, `awk` is still symlinked to `mawk` [1].

 > [1] https://bugs.launchpad.net/ubuntu/+source/mawk/+bug/1841654

 > Signed-off-by: Hubert Lacote <hubert.lacote@youview.com>
 > Co-authored-by: Hubert Lacote <hubert.lacote@youview.com>
 > Co-authored-by: Vicente Olivert Riera <vincent.olivert.riera@youview.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
