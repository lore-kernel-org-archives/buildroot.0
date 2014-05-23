From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 23 May 2014 15:09:03 +0100
Subject: [Buildroot] Call for volunteer(s): cups security bump
In-Reply-To: <537F5565.1010903@zacarias.com.ar>
References: <537F5565.1010903@zacarias.com.ar>
Message-ID: <537F567F.6080602@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/23/2014 03:04 PM, Gustavo Zacarias wrote:
> Hi all.
>
> I'm one of the people who is regularly involved in patching/bumping
> packages when security bugs are discovered and i've got a list of
> packages in need of love.
> This is a call for volunteers because i think it's important to keep the
> package base clean regarding security vulnerabilities.
>
> Right now i have one outstanding package that is in dire need of a
> version bump: cups.
> If you're a regular cups user for your buildroot project(s) then this
> might be of benefit/interest to you.
> Normally i'd love to do it myself but my free time availability isn't
> that great and my test bed consists of a lonely printer so it isn't much
> to talk home about.
>
> It ain't simple since a lot of things changed from our current 1.3.x
> branch to the latest 1.7.x, most notably it talks to usb printers via
> libusb rather than the kernel and foomatic-filters is deprecated in
> favour of cups-filter, among a bunch of new deps (packages) needed to
> build it.
> If you need to know what bugs afflict it just look at:
> http://www.cvedetails.com/vulnerability-list/vendor_id-49/product_id-14145/Apple-Cups.html
> Cups 1.3.11 was released on 2 july 2009, so at least any CVE-2010*+
> probably(1) affects it, and some of the CVE-2009* entries too.
>
> Any takers for this?
> Regards.
>
> Note 1: if it's new functionality from a newer branch it may not,
> optionally part of bumping is looking at those details to quote them in
> the commit log.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I was testing cups-1.7.1 in buildroot few months ago. Seems that cups 
upstream doesn't care about cross-compiling:

https://www.cups.org/str.php?L4387


-- 
Vincent
