From: Daniel Price <daniel.price@gmail.com>
Date: Mon, 7 Nov 2016 15:15:56 -0800
Subject: [Buildroot] Looking for Pointers and Info: Active Directory &
	Kerberos
Message-ID: <CAKduhSuPAxx8m9O2GdgG_J9pSNii-pKwQe_663imJS3y9bd+tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

Our team is looking to integrate Active Directory client support into our
buildroot-based appliance.  To do so we think we need a working kerberos
client.

We are ultimately trying to get a working pam-krb5 module (
https://www.eyrie.org/~eagle/software/pam-krb5/); it depends on either
Heimdal or MIT Kerberos.

So, we are struggling to work out the right stack to use, and trying to
work out whether anyone else has paved the way already.  Because of the
existing host-heimdal recipe, we spent some time trying to get a
cross-build of Heimdal to work.  However we recently noticed that Debian
seems to be on the cusp of removing its support for Heimdal (see
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=837728).  And we had
trouble getting the pam-krb5 module to see heimdal at all.

Has anyone else worked through this?  Has anyone else got MIT kerberos up
and running?  Pointers much appreciated.

      -dp

-- 
Daniel.Price at gmail.com; Twitter: @danielbprice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161107/93775169/attachment.html>
