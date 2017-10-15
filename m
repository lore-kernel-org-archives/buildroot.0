From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 23:00:16 +0200
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xserver_xorg-server:
	security bump version to 1.19.5
In-Reply-To: <20171014113728.22890-4-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 14 Oct 2017 13:37:28 +0200")
References: <20171014113728.22890-1-bernd.kuhls@t-online.de>
 <20171014113728.22890-4-bernd.kuhls@t-online.de>
Message-ID: <87fuakw2hr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > xfixes: unvalidated lengths (CVE-2017-12183)

 > Xi: fix wrong extra length check in ProcXIChangeHierarchy
 >  (CVE-2017-12178)

 > dbe: Unvalidated variable-length request in ProcDbeGetVisualInfo
 >  (CVE-2017-12177)

 > Unvalidated extra length in ProcEstablishConnection (CVE-2017-12176)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
