From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:37:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/uhd: USRP1 needs gcc >= 4.9
In-Reply-To: <20210522162924.16002-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 22 May 2021 18:29:24 +0200")
References: <20210522162924.16002-1-fontaine.fabrice@gmail.com>
Message-ID: <87im2puzk0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit c577eac16eaae515973faf3013da197516bfd391 forgot to add
 > dependencies of BR2_PACKAGE_UHD_USB to BR2_PACKAGE_UHD_USRP1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/eaae6548fb536e2b0ea539c236cd7579e63fa21e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
