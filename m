From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 23:26:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/alljoyn*: Remove the Alljoyn
 framework packages
In-Reply-To: <20191030131257.231044-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Wed, 30 Oct 2019 14:12:57 +0100")
References: <20191030131257.231044-1-titouan.christophe@railnova.eu>
Message-ID: <87y2x0361j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > The upstream Alljoyn project is dead since the AllSeen
 > Alliance merged with the Open Connectivity Foundation
 > back in 2016. No other package depends on Alljoyn, so
 > it can be removed.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
 > ---
 > Changes v1->v2:
 >  - Add removed options in Config.in.legacy
 >  - Write down justification for removal in the commit message 
 
 >  comment "Legacy options removed in 2019.11"
 
 > +config BR2_PACKAGE_ALLJOYN
 > +	bool "alljoin-base was removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  The alljoyn framework is dead
 > +

I got kicked off the list and didn't receive v3 - So I'm replying here
even though I've applied v3 after fixing s/alljoin/alljoyn/ in all the
help texts, thanks.

-- 
Bye, Peter Korsgaard
