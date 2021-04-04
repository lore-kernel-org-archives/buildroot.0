From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Apr 2021 21:11:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to
 version 3.7.1
In-Reply-To: <20210331214705.1492158-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 31 Mar 2021 23:47:05 +0200")
References: <20210331214705.1492158-1-fontaine.fabrice@gmail.com>
Message-ID: <87wnthyie3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-20231 and CVE-2021-20232:
 >   https://www.gnutls.org/security-new.html#GNUTLS-SA-2021-03-10
 > - Drop patch (not needed since:
 >   https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=b2d4b6c87827e34a694278d085a31508af052a37)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
