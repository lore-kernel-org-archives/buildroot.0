From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Date: Mon, 8 Apr 2019 10:06:33 +0200 (CEST)
Subject: [Buildroot] [PATCH 3/3] package/linux-headers: add support for
 Linux 5.1 kernel headers
In-Reply-To: <87y34lgcqa.fsf@dell.be.48ers.dk>
References: <1905283465.159802.1554361271608.JavaMail.zimbra@kalray.eu>
 <2016794590.159827.1554361302233.JavaMail.zimbra@kalray.eu>
 <436454902.159974.1554361384065.JavaMail.zimbra@kalray.eu>
 <87ef6el23j.fsf@dell.be.48ers.dk>
 <1715855918.438291.1554707937551.JavaMail.zimbra@kalray.eu>
 <87y34lgcqa.fsf@dell.be.48ers.dk>
Message-ID: <1406533656.445702.1554710793435.JavaMail.zimbra@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, that was the intended modification.
But it can probably wait for the 5.1 release if needed.

>>>>>> "Cl?ment" == Cl?ment Leger <cleger@kalray.eu> writes:
> 
> > Absolutely :/. I will resend it as a separate one if you are ok with that.
> 
> Yes, please - But as 5.1 has not been released yet, I'm not sure what
> exactly you want to update in linux-headers? Just the
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1 symbol?
> 
> --
> Bye, Peter Korsgaard
