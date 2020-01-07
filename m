From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jan 2020 23:06:32 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/quota: fix NLS build
In-Reply-To: <20191226110122.2623089-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 26 Dec 2019 12:01:22 +0100")
References: <20191226110122.2623089-1-fontaine.fabrice@gmail.com>
Message-ID: <874kx6j507.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Replace patch by QUOTA_GETTEXTIZE = YES

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
