From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2016 17:51:17 +0100
Subject: [Buildroot] [PATCH 1/2] armadillo: drop useless
	ARMADILLO_VERSION_MAJOR variable
In-Reply-To: <1454053963-1805-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Fri, 29 Jan 2016 08:52:42 +0100")
References: <1454053963-1805-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <878u38mire.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > ~/buildroot$ grep -R ARMADILLO_VERSION_MAJOR .
 > ./package/armadillo/armadillo.mk:ARMADILLO_VERSION_MAJOR = 5.100
 > ./package/armadillo/armadillo.mk:ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).2

Committed both, thanks.

-- 
Bye, Peter Korsgaard
