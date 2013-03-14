From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Mar 2013 08:49:36 +0100
Subject: [Buildroot] [PATCH 2 of 3] oprofile: upstep 0.9.7 patches to
 0.9.8
In-Reply-To: <5140DD96.3040104@mind.be>
References: <patchbomb.1363111853@BEANTN0L019720>
 <41943bd3969a02bce5f9.1363111855@BEANTN0L019720>
 <20130313082420.0ae03777@skate>
 <CAAXf6LXwyWv2KfQ3OW=KNYm7SN+y++79puqeN=C+yR50M-f5cw@mail.gmail.com>
 <5140DD96.3040104@mind.be>
Message-ID: <20130314084936.1a16bf2f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas,

On Wed, 13 Mar 2013 21:12:06 +0100, Arnout Vandecappelle wrote:

> > Are we already making these changes, or are we waiting for someone to
> > fix the central patching code according to the new rules first?
> 
>   There is nothing to be fixed in the central patching code (at least not 
> for this use case). Remove the version number.

Just to expand on Arnout answer: even though we haven't yet removed the
support for versioned patches in the infrastructure, we have already
been converting all the new packages, and many packages we were
touching, to unversioned names. This will make it easier to change the
package infrastructure later.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
