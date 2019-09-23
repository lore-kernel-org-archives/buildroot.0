From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Sep 2019 22:05:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: security bump to
 version 1.8.5
In-Reply-To: <20190922191553.29826-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 22 Sep 2019 21:15:53 +0200")
References: <20190922191553.29826-1-fontaine.fabrice@gmail.com>
Message-ID: <87h852wzgz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop second and third patches (alredy in version)
 > - Add mitigation against an ECDSA timing attack. [T4626,CVE-2019-13627]

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
