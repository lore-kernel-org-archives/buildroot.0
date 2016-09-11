From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 13:55:13 +0200
Subject: [Buildroot] [PATCH v2] openal: Explicitly enable/disable NEON
 support
In-Reply-To: <9791f7f9-3928-8f8f-b68b-1d1c65639d27@dawncrow.de>
References: <1472754894-6903-1-git-send-email-nerv@dawncrow.de>
 <20160906222510.17123fa6@free-electrons.com>
 <9791f7f9-3928-8f8f-b68b-1d1c65639d27@dawncrow.de>
Message-ID: <20160911135513.23cebe29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Sep 2016 14:09:37 +0200, Andr? Hentschel wrote:

> Sorry was on a business trip.
> As it is upstream meanwhile (together with a runtime neon check suggested by you) I'm fine with a patch added to the openal package.
> It's your work, so be free to do so.

If you could send a Buildroot patch adding the upstream fix, it would
be nice.

> Or do you know about plans of an upcoming openal bugfix release?
> That'd be easier I guess

I'm not aware of upstream plans in terms of new releases, I don't know
if they do regular ones or not. In order to avoid seeing build
failures, backporting the upstreaming fix would be a good thing to do
for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
