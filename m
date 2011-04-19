From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2011 22:24:32 +0200
Subject: [Buildroot] Fwd: Re:  mysql Server
In-Reply-To: <4DA5E45E.5060500@michaelburghart.de>
References: <4DA5E45E.5060500@michaelburghart.de>
Message-ID: <20110419222432.33d12817@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Apr 2011 19:58:54 +0200
Michael Burghart <mb@michaelburghart.de> wrote:

> > You created a Config.in under package/mysql.  You then have to add
> > that file reference to package/Config.in.
> 
> aaah... thanks a lot!!

Note that this is well documented in the Buildroot documentation:
http://buildroot.org/downloads/buildroot.html#config-in-file

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
