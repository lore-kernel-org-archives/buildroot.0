From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Sep 2013 10:37:29 +0200
Subject: [Buildroot] Am I using hardware floating? (CodeBench)
In-Reply-To: <20130921152445.GA9629@zuhnb712>
References: <20130921152445.GA9629@zuhnb712>
Message-ID: <20130922103729.10b54416@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Sat, 21 Sep 2013 23:24:45 +0800, Woody Wu wrote:

> The toolchain I selected is codebench from buildroot. CPU is ARM
> s3c2416. I want to know what kind of floating method is used in my
> system. Does this related to BR?

The S3C2416 is an ARM926, and it does not have a floating point unit,
so your only solution is to use software floating point on this
platform.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
