From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 19:53:48 +0100
Subject: [Buildroot] [PATCH 1/1] websocketpp: new package
In-Reply-To: <20181114214325.25574-1-ryan.barnett@rockwellcollins.com> (Ryan
 Barnett's message of "Wed, 14 Nov 2018 15:43:25 -0600")
References: <20181114214325.25574-1-ryan.barnett@rockwellcollins.com>
Message-ID: <87a7m6nrnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
 > ---
 >  DEVELOPERS                           |  1 +
 >  package/Config.in                    |  1 +
 >  package/websocketpp/Config.in        | 15 +++++++++++++++
 >  package/websocketpp/websocketpp.hash |  3 +++
 >  package/websocketpp/websocketpp.mk   | 15 +++++++++++++++
 >  5 files changed, 35 insertions(+)
 >  create mode 100644 package/websocketpp/Config.in
 >  create mode 100644 package/websocketpp/websocketpp.hash
 >  create mode 100644 package/websocketpp/websocketpp.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 53467da489..7c21b2f520 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1822,6 +1822,7 @@ F:	package/python-pysnmp/
 >  F:	package/python-pysnmp-apps/
 >  F:	package/python-pysnmp-mibs/
 >  F:	package/python-tornado/
 > +F:	package/websocketpp/

Committed to next after fixing the alphabetical ordering as pointed out
by Ryan, thanks.

-- 
Bye, Peter Korsgaard
