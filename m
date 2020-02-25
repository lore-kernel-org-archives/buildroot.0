From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Feb 2020 17:32:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: fix build with
 SSP
In-Reply-To: <20200223232005.3178422-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 24 Feb 2020 00:20:05 +0100")
References: <20200223232005.3178422-1-fontaine.fabrice@gmail.com>
Message-ID: <87blpmfx0j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Thanks to this patch, kvm-unit-tests will always be built without SSP as
 > intented by upstream. This will fix the build on ppc64 with SSP that
 > started to fail for an unknown reason since November 27th.

 > Moreover, the Arch Linux workaround could also be removed in a follow-up
 > patch.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
