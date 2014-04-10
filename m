From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Apr 2014 10:15:13 +0200
Subject: [Buildroot] [PATCH v2] expect: new package 5.45
In-Reply-To: <5b136bda-caa5-47d1-9940-23d54caa06f8@email.android.com>
References: <1397051636-22272-1-git-send-email-andrew.ruder@elecsyscorp.com>
 <5b136bda-caa5-47d1-9940-23d54caa06f8@email.android.com>
Message-ID: <20140410101513.6354299c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 09 Apr 2014 21:47:01 +0200, Thomas De Schampheleire wrote:

> >+EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)
> 
> I don't have the sources available right now, but don't we have a variable that points to sourceforge? BR2_SOURCEFORGE_MIRROR I thought...

No, we removed it. This is because downloads.sourceforge.net already
does the balancing across the mirrors.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
