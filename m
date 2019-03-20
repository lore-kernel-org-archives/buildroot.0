From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 21:17:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/jq: security bump to version 1.6
In-Reply-To: <20190320191001.6968-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 20 Mar 2019 20:10:01 +0100")
References: <20190320191001.6968-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1gtcncc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2015-8863 and  CVE-2016-4074:
 >   https://github.com/stedolan/jq/issues/1406
 > - Add hash for license file
 > - Disable oniguruma (enabled by default)

I had no idea what oniguruma was. Apparently a regexp engine.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
