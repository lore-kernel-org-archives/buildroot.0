From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 21:52:33 +0200
Subject: [Buildroot] [PATCH 1/3] udftool: add missing dependency on
 readline
In-Reply-To: <20180422212005.13062-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 22 Apr 2018 23:20:03 +0200")
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
 <20180422212005.13062-2-thomas.petazzoni@bootlin.com>
Message-ID: <87in80pnni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > udftool/Config.in selects BR2_PACKAGE_READLINE, but udftool does not
 > depend on it. Readline is not a runtime dependency: one of the udftool
 > program links against it.

 > This commit fixes this inconsistency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
