From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 10:37:42 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: add option to install
 utilities
In-Reply-To: <1357421950-16251-1-git-send-email-yann.morin.1998@free.fr>
References: <1357421950-16251-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130107103742.09a22197@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  5 Jan 2013 22:39:10 +0100, Yann E. MORIN wrote:
> Previously, dvb-apps was a 'blind' package that would install
> only the transponders data files for use by external packages
> (namely tvheadend).
> 
> Now, we add an option to also install the DVB utilities.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some related build failures:

 * libiconv issue
   http://autobuild.buildroot.org/results/c58e249202cb08d6420814598b1463eaff6bcc5c/build-end.log

 * largefile issue
   http://autobuild.buildroot.org/results/32ebe004606cd25fe57290486d4be9e5f36f927c/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
