From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 May 2014 11:04:21 -0300
Subject: [Buildroot] Call for volunteer(s): cups security bump
Message-ID: <537F5565.1010903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.

I'm one of the people who is regularly involved in patching/bumping
packages when security bugs are discovered and i've got a list of
packages in need of love.
This is a call for volunteers because i think it's important to keep the
package base clean regarding security vulnerabilities.

Right now i have one outstanding package that is in dire need of a
version bump: cups.
If you're a regular cups user for your buildroot project(s) then this
might be of benefit/interest to you.
Normally i'd love to do it myself but my free time availability isn't
that great and my test bed consists of a lonely printer so it isn't much
to talk home about.

It ain't simple since a lot of things changed from our current 1.3.x
branch to the latest 1.7.x, most notably it talks to usb printers via
libusb rather than the kernel and foomatic-filters is deprecated in
favour of cups-filter, among a bunch of new deps (packages) needed to
build it.
If you need to know what bugs afflict it just look at:
http://www.cvedetails.com/vulnerability-list/vendor_id-49/product_id-14145/Apple-Cups.html
Cups 1.3.11 was released on 2 july 2009, so at least any CVE-2010*+
probably(1) affects it, and some of the CVE-2009* entries too.

Any takers for this?
Regards.

Note 1: if it's new functionality from a newer branch it may not,
optionally part of bumping is looking at those details to quote them in
the commit log.
