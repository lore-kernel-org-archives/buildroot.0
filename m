From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 15:01:31 +0100
Subject: [Buildroot] [PATCH v3] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <1549286891-10671-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Mon, 4 Feb 2019 14:28:11 +0100")
References: <1549286891-10671-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87h8djveis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > From: James Hilliard <james.hilliard1@gmail.com>
 > Some of our cdn's are going discontinued (rawgit) and some others are
 > not recommended anymore, thus we update to the recommended cdnjs.
 > This patch enables also SRI protection on js to be sure the modules we
 > download are not manipulated in any way.

 > About SRI:
 > https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 > [v1 -> v2]:
 > * Fixing wrong CDN for bootswatch
 > * Fixing commit message

 > [v2 -> v3]:
 > * Better commit message
 > * Giving sha256 to bootswatch SRI for conformity with the other cdns sri

Committed, thanks.

I'm still not sure if it wouldn't be simpler / more robust to just
include the few files under docs/website instead, but that can be done
later.

-- 
Bye, Peter Korsgaard
