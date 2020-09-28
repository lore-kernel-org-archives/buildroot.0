From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Sep 2020 22:59:14 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/nginx: use /run for PIDFile
In-Reply-To: <20200919151807.3e25f549@windsurf.hq.k.grp> (Thomas Petazzoni's
 message of "Sat, 19 Sep 2020 15:18:07 +0200")
References: <20200916153340.345-1-buildroot@heine.tech>
 <20200916153510.476-1-buildroot@heine.tech>
 <20200919151807.3e25f549@windsurf.hq.k.grp>
Message-ID: <87sgb1zkgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 16 Sep 2020 17:35:03 +0200
 > Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

 >> Fixes:
 >> 
 >> systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
 >> a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
 >> /run/nginx.pid; please update the unit file accordingly.
 >> 
 >> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
 >> ---
 >> package/nginx/nginx.service | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Thanks, series applied.

Series (except for the htpdate one) committed to 2020.02.x, 2020.05.x
and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
