From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jul 2010 00:04:00 +0200
Subject: [Buildroot] BR:Qt doesn't compile
In-Reply-To: <AANLkTilS9pLCoV5S6u-EfrLsUuQT80XGfK2DvyY5nmxb@mail.gmail.com>
	(Nataraj S. Narayan's message of "Tue, 13 Jul 2010 11:57:43 +0530")
References: <AANLkTilS9pLCoV5S6u-EfrLsUuQT80XGfK2DvyY5nmxb@mail.gmail.com>
Message-ID: <87bpa7xewf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

 Nataraj> Hi
 Nataraj> #make qt

 Nataraj> Creating qmake. Please wait...
 Nataraj> make[1]: Entering directory `/home/noy/buildroot/output/build/
 Nataraj> qt-everywhere-opensource-src-4.6.2/qmake'
 Nataraj> make[1]: Leaving directory `/home/noy/buildroot/output/build/
 Nataraj> qt-everywhere-opensource-src-4.6.2/qmake'
 Nataraj> MySQL support cannot be enabled due to functionality tests!
 Nataraj> ?Turn on verbose messaging (-v) to ./configure to see the final report.

Fixed in git.

-- 
Bye, Peter Korsgaard
