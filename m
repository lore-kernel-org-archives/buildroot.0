From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 23:56:52 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <bb95fc23-ae23-3f4b-da4c-13bda8aa7e07@mind.be>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305223726.GM3671@free.fr> <87a88xccuv.fsf@dell.be.48ers.dk>
 <bb95fc23-ae23-3f4b-da4c-13bda8aa7e07@mind.be>
Message-ID: <20170307235652.10fefb7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Mar 2017 18:05:02 +0100, Arnout Vandecappelle wrote:

>  The problem with BROKEN is the same as with BR2_LEGACY: it doesn't appear in
> the legacy menu. You could argue that BROKEN is different because it simply
> can't be used at all. However, for the user there is no difference: it used to
> work (I hope we can assume that when a package is added, it has worked at least
> once on at least one platform...), and after a Buildroot update it suddenly
> vanishes.

Agreed. In this specific case, I believe odroid-mali definitely works
for some situations, so there are certainly valid use cases for the
package as it is today, i.e it is not *completely* broken. But it
causes some build failures, which nobody has taken care of, and
upstream is unlikely to be responsive/

>  So I propose the following: we can still mark things as BROKEN as a way to
> motivate people to fix them, but during the RC month we properly remove them and
> add a legacy entry.

Full ACK.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
