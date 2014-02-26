From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 16:22:02 +0100
Subject: [Buildroot] [lua v2 2/4] lua: refactor install steps
In-Reply-To: <CAB0FRssmso3x1ctLXfZNS8YOWFm0U3ao-ES+-EeDktyWxLoJXw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Wed, 26 Feb 2014
 16:14:15 +0100")
References: <1393408997-32259-1-git-send-email-francois.perrad@gadz.org>
 <1393408997-32259-3-git-send-email-francois.perrad@gadz.org>
 <87mwhedl2s.fsf@dell.be.48ers.dk>
 <CAB0FRssmso3x1ctLXfZNS8YOWFm0U3ao-ES+-EeDktyWxLoJXw@mail.gmail.com>
Message-ID: <87ios1ew6d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > 2014-02-26 15:07 GMT+01:00 Peter Korsgaard <jacmet@uclibc.org>:
 >>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > since the comeback of version in module path (see commit ccd68a51)
 >> > the upstream Makefiles are usable for install.
 >> 
 >> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 >> 
 >> What is the impact of this? Why do we want it for 2014.02?

 > See Arnout's request in :
 >  http://patchwork.ozlabs.org/patch/323460/
 >  http://patchwork.ozlabs.org/patch/314146/

Ok, thanks. A bit more detailed commit description would be nice for
future patches would be good.

-- 
Bye, Peter Korsgaard
