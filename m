From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 15:06:12 +0100
Subject: [Buildroot] [PATCH] docs/website: fixing query.yahooapis.com
 shutdown
In-Reply-To: <1549287004-13747-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Mon, 4 Feb 2019 14:30:04 +0100")
References: <1549287004-13747-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87d0o7veaz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch rework the use of query.yahooapis.com to do the conversion
 > from xml to json required by our script and moves to the use of a js
 > library. Datas are therefore now converted in json format on the client.

 > Unfortunately, cause of the CORS restriction on nabble and
 > buildroot.org, we cannot retrieve directly the xml data from these
 > servers and we need a CORS proxy to do that.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed after changing the integrity tag to use sha256 for consistency
with the others, thanks.

-- 
Bye, Peter Korsgaard
