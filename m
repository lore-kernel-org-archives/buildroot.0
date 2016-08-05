From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Aug 2016 09:14:07 +0200
Subject: [Buildroot] [PATCH] package/libdvdread: needs host-pkgconf
In-Reply-To: <1470343909-5420-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Thu, 4 Aug 2016 22:51:49 +0200")
References: <1470343909-5420-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87twezelhc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Add host-pkgconf to the dependencies since pkg-config is used to find
 > libdvdcss.

 > Fixes:
 > http://autobuild.buildroot.net/results/e5f/e5fffdd51bdd6962149a836af1e7a6bbc6bae20c

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
