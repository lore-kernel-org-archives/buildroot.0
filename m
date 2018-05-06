From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 09:05:06 +0200
Subject: [Buildroot] [PATCH 1/1] ghostscript: don't use lcms2art
In-Reply-To: <20180505165821.14748-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 May 2018 18:58:21 +0200")
References: <20180505165821.14748-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9hts1r1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Delete lcsm2art directory to use the buildroot lcms2 library
 > Fixes:
 >  - http://autobuild.buildroot.net/results/cda9c22bf29278cc24ab852094df19b773d0f151

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
