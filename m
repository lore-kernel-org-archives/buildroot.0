From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 10:37:05 +0100
Subject: [Buildroot] Samba 4.1 in buildroot
In-Reply-To: <1383038690.12630.7.camel@sven>
References: <1383038690.12630.7.camel@sven>
Message-ID: <20131029103705.2813a190@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Tue, 29 Oct 2013 10:24:50 +0100, Sven Neumann wrote:

> the recently released version 4.1 of the Samba suite finally supports
> the SMB2 und SMB3 protocols on the server and client side. This is a
> feature that we are in desperate need of and thus I would like to get
> Samba 4 into buildroot.
> 
> So my questions are:
> 
> (1) Is anyone already working on this?

Maxime Ripard had started an effort, but since Samba4 is now based on
'waf', the number of cross-compilation issues is important, and they
are not necessarily easy to fix. We might have some opportunity to work
on this in the near future, but it's not exactly clear when.

> (2) Would you prefer if the samba package was just ported to the latest
>     stable samba 4 version or would you prefer if a new package called
>     samba4 was added? In case that you prefer the latter, should the
>     existing samba package be renamed to samba3?

I believe it should be a different package. We can keep the existing
package named 'samba', and have the new one named 'samba4', I don't
think renaming the old one from samba to samba3 is really worth the
effort.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
