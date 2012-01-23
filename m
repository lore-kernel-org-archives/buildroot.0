From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2012 09:59:23 +0100
Subject: [Buildroot] [PATCH] sqlcipher: new package
In-Reply-To: <1327183020-16149-1-git-send-email-arnout@mind.be>
References: <1327183020-16149-1-git-send-email-arnout@mind.be>
Message-ID: <20120123095923.56576574@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 21 Jan 2012 22:57:00 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> SQLCipher is a fork of SQLite that adds AES encryption using OpenSSL.
> It relies on tcl to generate some of its source code, so host-tcl is
> required.

The dependency on host-tcl is missing, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
