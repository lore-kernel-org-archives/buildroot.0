From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 22:24:00 +0100
Subject: [Buildroot] [PATCH 1/1] ympd: bump to version 1.3.0
In-Reply-To: <20180309224912.25244-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 9 Mar 2018 23:49:12 +0100")
References: <20180309224912.25244-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7vfbp5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Remove mkdata hook as this is not needed since version 1.2.3.
 > Indeed, when CMAKE_CROSSCOMPILING is defined, ympd will use a perl
 > script (mkdata.pl) instead of mkdata binary

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
