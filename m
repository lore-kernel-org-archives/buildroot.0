From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 16:18:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: needs host gcc >= 4.9
In-Reply-To: <20200915175139.400535-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Sep 2020 19:51:39 +0200")
References: <20200915175139.400535-1-fontaine.fabrice@gmail.com>
Message-ID: <87mu18y8ca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit dbe2d2e686281c19739824d4d4faec62187d1779 forgot to add a
 > host gcc >= 4.9 dependency on efl (because of host-efl)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f627d44919c20e068e377d7fe113833e2d4d0ad3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
