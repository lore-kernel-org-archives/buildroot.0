From: John Stile <john@stilen.com>
Date: Wed, 27 Feb 2013 13:51:29 -0800
Subject: [Buildroot] setting timezone from web page
Message-ID: <1362001889.29197.269.camel@genx.eng.msli.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot for a device where the user can set the timezone
via a web page, and the web page gets it's list of timezones from:
http://www.ietf.org/timezones/data/zone.tab
But those don't work in /etc/TZ.

I found some documentation that says buildroot's /etc/TZ should follow
rules according to Single Unix Specification Version 3

Is there a way to translates/transcribes IETF timezone into a Single
Unix Specification Version 3?

If not is there a compatible zone.tab for buildroot's  /etc/TZ?

Is there a better way to do all this?

I'm on buildroot-2011.11.
