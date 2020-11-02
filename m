From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 22:56:34 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libpam-tacplus: fix build when time_t is 64 bits
In-Reply-To: <20200518161525.2935223-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 May 2020 18:15:25 +0200")
References: <20200518161525.2935223-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtzza0dp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Update patch to avoid a build failure when time_t is 32 bits

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
