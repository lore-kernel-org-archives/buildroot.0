From: Christophe Vu-Brugier <cvubrugier@lacie.com>
Date: Tue, 29 Oct 2013 11:58:10 +0100
Subject: [Buildroot] Samba 4.1 in buildroot
In-Reply-To: <20131029103705.2813a190@skate>
References: <1383038690.12630.7.camel@sven>
	<20131029103705.2813a190@skate>
Message-ID: <20131029115810.5670c15f@grp-cvubrugier.lacie.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 29 Oct 2013 10:37:05 +0100, Thomas Petazzoni wrote :
> On Tue, 29 Oct 2013 10:24:50 +0100, Sven Neumann wrote:
> 
> > the recently released version 4.1 of the Samba suite finally supports
> > the SMB2 und SMB3 protocols on the server and client side. This is a
> > feature that we are in desperate need of and thus I would like to get
> > Samba 4 into buildroot.
> > 
> > So my questions are:
> > 
> > (1) Is anyone already working on this?
> 
> Maxime Ripard had started an effort, but since Samba4 is now based on
> 'waf', the number of cross-compilation issues is important, and they
> are not necessarily easy to fix. We might have some opportunity to work
> on this in the near future, but it's not exactly clear when.

As said by Thomas, the cross-compilation of Samba 4.1 is broken.

The issue was discussed on the Samba mailing list:

  http://samba.2283325.n4.nabble.com/Cross-compiling-with-4-1-td4652835.html
  https://bugzilla.samba.org/show_bug.cgi?id=10128

I too may "have some opportunity to work on this in the near future, but
it's not exactly clear when" :)

Best regards,

-- 
Christophe Vu-Brugier
