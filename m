From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:44:46 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: support building the binary
 without MMU
In-Reply-To: <5586AF6B.6020304@mind.be>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <20150621064540.534ebebc@free-electrons.com>
 <5586AF6B.6020304@mind.be>
Message-ID: <20150630164446.19340dc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 21 Jun 2015 14:34:51 +0200, Arnout Vandecappelle wrote:

> > Hum. But then it means that we have propagated the MMU dependency to
> > all reverse dependencies of openssl (i.e packages that depend on
> > openssl), but they may no longer need this dependency anymore.
> 
>  This is only about BR2_PACKAGE_OPENSSL_BIN, which is not selected by any package.

I obviously missed that. Thanks for noticing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
