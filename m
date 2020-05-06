From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:10:59 +0200
Subject: [Buildroot] [PATCH] package/exim: fix log and pid file paths
In-Reply-To: <20200413230620.10e385a7@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 13 Apr 2020 23:06:20 +0200")
References: <20200302101902.8285-1-p.debruijn@unilogic.nl>
 <20200413230620.10e385a7@windsurf.home>
Message-ID: <87v9l9fy1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon,  2 Mar 2020 11:19:02 +0100
 > Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

 >> both the logs and pid should not be placed in /var/spool
 >> 
 >> we place the log in /var/log/exim and
 >> we place the pid in /var/run/exim
 >> 
 >> using binary name subdirectory in both cases allows for the
 >> use of systemd's LogsDirectory and RuntimeDirectory statements
 >> 
 >> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

 > Applied with an improved commit log. It would however be nice to
 > convert the exim init script to the "new" init script template, for
 > higher consistency.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
