From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jul 2012 11:17:48 +0200
Subject: [Buildroot] [PATCH] dependencies.sh: suppress output of locale
In-Reply-To: <1341985369-18125-1-git-send-email-arnout@mind.be>
References: <1341985369-18125-1-git-send-email-arnout@mind.be>
Message-ID: <20120711111748.1fbc0b54@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 07:42:49 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> +   if ! locale -a | grep -i utf8$ > /dev/null; then

What about grep -q ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
