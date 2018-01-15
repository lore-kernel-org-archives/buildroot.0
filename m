From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 15:22:46 +0100
Subject: [Buildroot] [PATCH v2,1/1] domoticz: fix build with boost 1.66
In-Reply-To: <20180114195944.18250-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Jan 2018 20:59:44 +0100")
References: <20180114195944.18250-1-fontaine.fabrice@gmail.com>
Message-ID: <871sirw6a1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Patch fetch from one of the answer of
 >  https://github.com/domoticz/domoticz/issues/2034
 > (issue still opened, no official PR sent upstream)

 > Boost asio changed its API:
 >  - http://www.boost.org/doc/libs/1_66_0/doc/html/boost_asio/net_ts.html

 > Fixes:
 >  - http://autobuild.buildroot.net/results/5f02c8fc84889748f283ee1cb76248bb0880215a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Jorg Krause):
 >  - Add a note about patch's origin and upstream status

Committed, thanks.

-- 
Bye, Peter Korsgaard
