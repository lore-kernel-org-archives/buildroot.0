From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:27:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/mobile-broadband-provider-info:
 needs host-libxslt
In-Reply-To: <20191024180046.11329-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 24 Oct 2019 20:00:46 +0200")
References: <20191024180046.11329-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv7x4yww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > xsltproc is needed to build apn-conf since version 20190618 and
 > https://github.com/GNOME/mobile-broadband-provider-info/commit/6dd77065c3beb4aa32218d76ba27efb83d507f42

 > Fixes:
 >  - http://autobuild.buildroot.org/results/824c5d67f12fa1a9ce31f2698eae986f14ca69ae

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
