From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:34:45 +0100
Subject: [Buildroot] [PATCH] package/syslog-ng: fix startup with systemd
In-Reply-To: <20190118184625.11484-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Fri, 18 Jan 2019 16:46:25 -0200")
References: <20190118184625.11484-1-casantos@datacom.com.br>
Message-ID: <87h8e43bl6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > By default syslog-ng installs a .service that requires a config file at
 > /etc/default, so provide one with the default values.

 > It's also necessary to enable the service by means of a symlink created
 > at /etc/systemd/system/multi-user.target.wants.

 > Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
