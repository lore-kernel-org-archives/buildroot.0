From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 23:12:52 +0100
Subject: [Buildroot] [PATCH v2,1/1] libcorrect: fix debug build
In-Reply-To: <20181120175906.24665-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 20 Nov 2018 18:59:06 +0100")
References: <20181120175906.24665-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgzvo0t7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a patch to use -fsanitize=address only when available
 > Fixes:
 >  - http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Add a patch instead of using Release target

Committed, thanks.

-- 
Bye, Peter Korsgaard
