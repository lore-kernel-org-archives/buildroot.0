From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 09:17:51 +0100
Subject: [Buildroot] [PATCH 1/1] xerces: add host
In-Reply-To: <OFDA43EF93.FECF1729-ON86257C2A.007C345A-86257C2A.007C6C20@rockwellcollins.com>
References: <1385063284-31586-1-git-send-email-mlweber1@rockwellcollins.com>
 <20131121225446.2ad2f3c2@skate>
 <OFDA43EF93.FECF1729-ON86257C2A.007C345A-86257C2A.007C6C20@rockwellcollins.com>
Message-ID: <20131122091751.563a9ead@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Thu, 21 Nov 2013 16:39:01 -0600, Matthew Weber wrote:

> Opps, should have included that.
> 
> I'm working on adding support for an older package called xalan that 
> requires host-xerces.
> However the build infrastructure in the xalan package is pretty bad and 
> I'm not sure if I'll be 
> able to get it cleaned up to the point of posting a patch set.  So for 
> now, I've submitted 
> this patch to add host-xerces support to allow us to build the xalan 
> package using 
> BR2_EXTERNAL until I get it hopefully cleaned up and submitted.

Hum, okay. I'm generally not a big fan on having the host variant of
packages if they are not used by packages in Buildroot. I usually
prefer when the host variant of package A is added as part of a patch
set that allows adds package B, which depends on host-A. That being
said, I do understand the idea of upstreaming what you can for now, and
see later for the remaining things.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
