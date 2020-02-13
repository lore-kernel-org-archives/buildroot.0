From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 18:13:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/doxygen: needs host gcc >= 4.9
In-Reply-To: <20200211213352.314822-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 11 Feb 2020 22:33:52 +0100")
References: <20200211213352.314822-1-fontaine.fabrice@gmail.com>
Message-ID: <8736befm1p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-doxygen use std::make_unique which is a C++14 feature and so not
 > available with host gcc 4.8 so add a Config.in.host for doxygen and add
 > host gcc 4.9 dependency to host-doxygen and sigrok C++ option

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3ac78c5d4728287bafdfeb3a54f50eb193934b63

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
