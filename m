From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 18:56:24 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/i7z: fix build with gcc 10
In-Reply-To: <20210119075300.790235-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Jan 2021 08:53:00 +0100")
References: <20210119075300.790235-1-fontaine.fabrice@gmail.com>
Message-ID: <87sg6wbyk7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1a433611ba8676cf1ca276fccaf3633971bd562e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Baruch Siach):
 >  - Use extern instead of static

Committed, thanks.

-- 
Bye, Peter Korsgaard
