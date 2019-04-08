From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Apr 2019 12:47:22 +0200
Subject: [Buildroot] [PATCH 3/3] package/linux-headers: add support for
 Linux 5.1 kernel headers
In-Reply-To: <1406533656.445702.1554710793435.JavaMail.zimbra@kalray.eu>
 (=?utf-8?Q?=22Cl=C3=A9ment?= Leger"'s message of "Mon, 8 Apr 2019 10:06:33
 +0200 (CEST)")
References: <1905283465.159802.1554361271608.JavaMail.zimbra@kalray.eu>
 <2016794590.159827.1554361302233.JavaMail.zimbra@kalray.eu>
 <436454902.159974.1554361384065.JavaMail.zimbra@kalray.eu>
 <87ef6el23j.fsf@dell.be.48ers.dk>
 <1715855918.438291.1554707937551.JavaMail.zimbra@kalray.eu>
 <87y34lgcqa.fsf@dell.be.48ers.dk>
 <1406533656.445702.1554710793435.JavaMail.zimbra@kalray.eu>
Message-ID: <87sgushiyt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cl?ment" == Cl?ment Leger <cleger@kalray.eu> writes:

 > Yes, that was the intended modification.
 > But it can probably wait for the 5.1 release if needed.

Up to you. Either send a patch now just for _CUSTOM_5_1 and then another
once 5.1 is released or wait.

When we add 5.1 I think it makes sense to remove 4.20 as it is now EOL.

-- 
Bye, Peter Korsgaard
