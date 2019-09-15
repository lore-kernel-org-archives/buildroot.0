From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 09:17:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fixup the 'v' prefix in
 the version
In-Reply-To: <20190911174630.648-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 11 Sep 2019 19:46:30 +0200")
References: <20190911174630.648-1-fontaine.fabrice@gmail.com>
Message-ID: <8736gy58pm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In order for the sslh version to match what is given by
 > release-monitoring.org, the 'v' prefix should be encoded in
 > SSLH_SOURCE and not SSLH_VERSION.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/sslh/sslh.mk | 3 ++-

You don't seem to change sslh.hash?

-- 
Bye, Peter Korsgaard
