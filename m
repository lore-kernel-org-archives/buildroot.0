From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:44:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/jq: needs threads
In-Reply-To: <20200718211134.1288605-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 18 Jul 2020 23:11:34 +0200")
References: <20200718211134.1288605-1-fontaine.fabrice@gmail.com>
Message-ID: <87d04nhiz3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > threads is a strong requirement since
 > https://github.com/stedolan/jq/commit/cf4b48c7ba30cb30e116b523cff036ea481459f6

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b871cc175655c2d6aa5f184d891b994a0ebd9902

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
