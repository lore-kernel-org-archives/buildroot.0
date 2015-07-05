From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 17:14:40 +0200
Subject: [Buildroot] [PATCH 10/38] inadyn: start in background mode
In-Reply-To: <a719f137d409fdbeac559237770c00e15066ef34.1432332802.git.alex.suykov@gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <a719f137d409fdbeac559237770c00e15066ef34.1432332802.git.alex.suykov@gmail.com>
Message-ID: <20150705171440.438d9869@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 23 May 2015 13:04:26 +0300, Alex Suykov wrote:
> Unless -b is specified, inadyn stays in foreground.

And? start-stop-daemon takes care of daemonizing it, no? At least, I've
tested the current inadyn init script, and it just works fine for me,
after some minor tuning that is not related to background/foreground.
See:

   http://patchwork.ozlabs.org/patch/491319/

Can you give more details as to why your patch is needed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
