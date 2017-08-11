From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Fri, 11 Aug 2017 11:19:07 -0400
Subject: [Buildroot] [PATCH v1] gst1-validate: disable buliding
 documentation using sphinx
In-Reply-To: <a2d4c688-435e-64da-4491-47e0aa4a4b5e@mind.be>
Message-ID: <15dd1e0a717-430c-11b69@webprd-a86.mail.aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

G'day Arnout,


Just gave a test of:


> GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
> should work as well, no?
> 
> Ross, could you test that?

And I can confirm this works also.
It looks a little more elegant!
The main thing is that none of that documentation is produced only to be thrown away,
wasting space and compute cycles.


It gets harder these days to work out what tools are prerequisites to build so many things!
I am not sure if meson will make this harder or easier, but it seems there are a number of packages that are starting to move towards meson instead of make with autoconf tooling.


So I am happy with either solution here, although the later seems just a little nicer!


Regards,


Ross


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170811/57adda91/attachment.html>
