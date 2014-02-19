From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 09:29:16 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
	Buildroot?
In-Reply-To: <20140219091822.08d1a87e@skate> (Thomas Petazzoni's message of
 "Wed, 19 Feb 2014 09:18:22 +0100")
References: <20140218231447.524a1a20@skate>
 <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
 <20140219091822.08d1a87e@skate>
Message-ID: <8738jf33qb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Khem Raj,
 > On Tue, 18 Feb 2014 16:23:11 -0800, Khem Raj wrote:

 >> > To give you an idea, Buildroot currently has more than 50 patches on
 >> > top of uClibc 0.9.33.2:
 >> >
 >> >   http://git.buildroot.net/buildroot/tree/package/uclibc/0.9.33.2/
 >> 
 >> Indeed, I see what you are saying here. In order to begin the process,
 >> can you send a list of patches
 >> that buildroot is carrying for inclusion into master.

 > Peter will confirm, but I believe that *all* our patches are backports
 > from the 0.9.33 branch at http://git.uclibc.org/uClibc/log/?h=0.9.33.
 > So there is no special fix in Buildroot that isn't already in mainline
 > uClibc.

That's the plan atleast. We normally don't carry any feature patches
(besides backports), but I would need to check to 100% sure.

-- 
Bye, Peter Korsgaard
