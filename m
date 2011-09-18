From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Sep 2011 22:47:37 +0200
Subject: [Buildroot] [PATCH 7/8] package: change ordering of steps
In-Reply-To: <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Sep 2011 22:22:57 +0200")
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <5a8e557f8f35394252c05dd5176e143b38a3469f.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874o097f2u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Currently, the dependency chain is :
 Thomas>  configure -> patch
 Thomas>  patch -> extract
 Thomas>  extract -> depends
 Thomas>  depends -> source + dependencies ready

 Thomas> This is a problem for RTAI, as :

Committed, thanks.

-- 
Bye, Peter Korsgaard
