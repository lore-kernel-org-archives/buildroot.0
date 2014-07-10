From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jul 2014 17:18:48 +0200
Subject: [Buildroot] [PATCH 10/10] busybox: support only one version
In-Reply-To: <87oawxntvt.fsf@dell.be.48ers.dk>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87oawxntvt.fsf@dell.be.48ers.dk>
Message-ID: <20140710171848.75381ecb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 10 Jul 2014 16:57:58 +0200, Peter Korsgaard wrote:

> I wonder if time also hasn't come to get rid of
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

I don't know. We've been discussing multiple times the SHOW_OTHERS
thing, and I believe each time our conclusion was that it's nice for
beginners to have Buildroot hide the applications for which Busybox
already provides a good alternative. I'm sure if we remove
SHOW_OTHERS, we'll have gazillions of newcomers enabling bash,
util-linux and millions of other things that aren't needed when you
have Busybox. So I still believe that SHOW_OTHERS is a good thing to
have.

I however wonder why the SHOW_OTHERS dependency is not pushed to the
individual Config.in of each package instead of cluttering
package/Config.in. I'm sure there was a reason behind this choice, but
I can't remember.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
