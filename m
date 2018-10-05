From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 20:36:27 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: no comment if BR2_USE_MMU
 is true
In-Reply-To: <20180926182045.28484-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 26 Sep 2018 20:20:44 +0200")
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
Message-ID: <87lg7c2qc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't display comment if BR2_USE_MMU is true
 > Moreover, move BR2_USE_MMU dependency at the top of dependency list

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
