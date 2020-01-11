From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 11:49:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix bluez5_utils
 dependency
In-Reply-To: <20200111083250.221622-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 11 Jan 2020 09:32:50 +0100")
References: <20200111083250.221622-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8vai7z2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit ab390616eb74fcb982c886408b53489dc42179bb wrongly added a
 > bluez_utils5 dependency instead of bluez5_utils

 > Fixes:
 >  - http://autobuild.buildroot.org/results/942aa07547068c9b47ce50c6dc016ee633e1a1c8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
