From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:50:51 +0200
Subject: [Buildroot] [PATCH] ntp: enable/disable sntp support depending
	on BR2_PACKAGE_NTP_SNTP
In-Reply-To: <20170619143325.19089-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 19 Jun 2017 15:33:25 +0100")
References: <20170619143325.19089-1-Vincent.Riera@imgtec.com>
Message-ID: <87r2y7i3vo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > We already have an option for selecting sntp support in ntp that can be
 > chosen from the menuconfig, and ntp's configure script has a --with-sntp
 > option (with its --without counterpart) which can be used for disabling
 > sntp support in ntp. However, we are not using it. This patch will make
 > use of it.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
