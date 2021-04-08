From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Apr 2021 09:39:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: do not install systemd
 service file
In-Reply-To: <20210406154235.609269-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 6 Apr 2021 17:42:35 +0200")
References: <20210406154235.609269-1-bernd.kuhls@t-online.de>
Message-ID: <875z0xb4xr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Upstream removed the sample service file for use with systemd:
 > https://gitweb.torproject.org/tor.git/commit/contrib?h=maint-0.4.5&id=915af1a65bc217fa33490876199bb69f760bea23

 > Fixes:
 > http://autobuild.buildroot.net/results/b80/b807f19283528b9f0d0c46250b660ea84695679c/
 > http://autobuild.buildroot.net/results/de4/de4f1a99b1c524b81579ee804156e26d3f8babe7/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
