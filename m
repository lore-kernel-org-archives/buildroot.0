From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 23:01:31 +0100
Subject: [Buildroot] [PATCHv7 5/5] docs/manual: add explanations about
	BR2_EXTERNAL
In-Reply-To: <1386270673-16051-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 5 Dec 2013 20:11:13 +0100")
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386270673-16051-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gbf9f44.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit updates the manual to add details on how to use the
 > BR2_EXTERNAL feature.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I'm no native speaker, but there's a few things I think sound odd:

 > +[[outside-br-custom]]
 > +Keeping customization outside Buildroot
 > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I think it should be 'customizations'

 > +
 > +The Buildroot community recommends and encourages upstreaming to the
 > +official Buildroot version the packages and board supports that are
 > +written by developers. However, it is sometimes not possible or
 > +desirable because some of these packages or board supports are highly
 > +specific or proprietary.

And 'board support', not supports.

Committed with that fixed (and the missing + as pointed out by Samuel),
thanks.

-- 
Bye, Peter Korsgaard
