From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:30:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: fix build with gcc <
 4.9
In-Reply-To: <20190221233359.7243-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 22 Feb 2019 00:33:59 +0100")
References: <20190221233359.7243-1-fontaine.fabrice@gmail.com>
Message-ID: <8736ofik9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable AVX2 if gcc < 4.9
 > Fixes:
 >  - http://autobuild.buildroot.org/results/195e40b34344f773da51a3fbff9d8e76c517eed1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
