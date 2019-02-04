From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 13:34:58 +0100
Subject: [Buildroot] [PATCH v2] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
 (Angelo Compagnucci's message of "Mon, 4 Feb 2019 11:17:25 +0100")
References: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <87y36vvij1.fsf@dell.be.48ers.dk>
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

It would be great for people not doing web things (E.G. me) to add the

https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity

to explain what SRI is.

The files we get from these CDNs are not that big, E.G:

-rw-r--r--  1 peko peko 139K May 17  2018 bootstrap.min.css
-rw-r--r--  1 peko peko  37K May 17  2018 bootstrap.min.js
-rw-r--r--  1 peko peko 2.4K May 17  2018 html5shiv.js
-rw-r--r--  1 peko peko  85K May 17  2018 jquery.min.js
-rw-r--r--  1 peko peko 4.0K May 17  2018 respond.min.js

Does it make sense to use those CDNs that we don't have under our
control, or should we just commit these files?

-- 
Bye, Peter Korsgaard
