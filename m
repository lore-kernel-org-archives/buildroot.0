From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2017 09:57:49 +0100
Subject: [Buildroot] [PATCH 1/1] Add notes explaining that SITE_METHOD
 == local prevents any patches from being applied to the package sources.
In-Reply-To: <CAAXf6LU_5HZ1aDfCi+T1SZcx3bk7276uReqP4HHvmSMiC-5+xg@mail.gmail.com>
References: <20170207204053.18749-1-grant.b.edwards@gmail.com>
 <CAAXf6LU_5HZ1aDfCi+T1SZcx3bk7276uReqP4HHvmSMiC-5+xg@mail.gmail.com>
Message-ID: <20170208095749.2ce2c8cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Feb 2017 22:46:43 +0100, Thomas De Schampheleire wrote:

> When a package source is overridden using the FOO_OVERRIDE_SRCDIR
> mechanism, the same is true: no patches are applied automatically, the
> overridden srcdir is supposed to be complete and used as-is. Perhaps
> the documentation updates could also cover that?

Exactly the comment I wanted to make, so yes, definitely agree with you.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
