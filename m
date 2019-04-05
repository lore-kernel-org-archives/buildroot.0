From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:28:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/thttpd: security bump to
 version 2.29
In-Reply-To: <20190330154631.28343-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 30 Mar 2019 16:46:31 +0100")
References: <20190330154631.28343-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnq0sc7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to "real" upstream instead of debian as debian does not
 >   have latest version
 > - Drop patch (not needed anymore as getline was renamed in my_getline)
 > - Add hash for license file
 > - Fix CVE-2013-0348 and CVE-2017-17663

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
