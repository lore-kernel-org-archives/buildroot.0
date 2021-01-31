From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 18:04:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: link with lintl if
 needed
In-Reply-To: <87czxlffqg.fsf@tarshish> (Baruch Siach's message of "Sun, 31 Jan
 2021 14:33:27 +0200")
References: <20210128070435.3771751-1-fontaine.fabrice@gmail.com>
 <87k0rutxla.fsf@dell.be.48ers.dk> <87czxlffqg.fsf@tarshish>
Message-ID: <87im7dqbpp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Jan 30 2021, Peter Korsgaard wrote:
 >>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > Fixes:
 >> >  - http://autobuild.buildroot.org/results/4dc94dadbc17e06a214478644f29877fe205f93d
 >> 
 >> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> 
 >> Committed, thanks.

 > Not in master as of commit 70acf563aa29 ("package/bitcoin: add CPE
 > variables").

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
