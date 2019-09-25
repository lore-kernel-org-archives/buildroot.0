From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:41:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/thttpd: fix systemd startup
In-Reply-To: <20190915151922.204a321f@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 15 Sep 2019 15:19:22 +0200")
References: <20190828021626.9688-1-unixmania@gmail.com>
 <20190828021626.9688-2-unixmania@gmail.com>
 <20190915151922.204a321f@windsurf.home>
Message-ID: <87ftkkkvt3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 27 Aug 2019 23:16:25 -0300
 > unixmania at gmail.com wrote:

 >> From: Carlos Santos <unixmania@gmail.com>
 >> 
 >> Create the configuration file as /etc/thttpd.conf, as expected by the
 >> systemd unit file.
 >> 
 >> This matches other web server packages that install configuration files
 >> at /etc/lighttpd/, /etc/apache2, etc.
 >> 
 >> Signed-off-by: Carlos Santos <unixmania@gmail.com>
 >> ---
 >> package/thttpd/thttpd.mk | 11 ++++++-----
 >> 1 file changed, 6 insertions(+), 5 deletions(-)

 > Applied to master, thanks.

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
