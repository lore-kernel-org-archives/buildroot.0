From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 09:27:51 +0100
Subject: [Buildroot] update on a file in tslib not reflected after doing
 "Make"
In-Reply-To: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
References: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
Message-ID: <20091215092751.7d9a48fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 Dec 2009 15:30:06 +0800,
Stanley <eva2002@gmail.com> a ?crit :

> Anyone knows how to resolve this problem?

Let Buildroot does its compilation process to the end.

Then, make your modifications to build_arm/tslib-x.x/. Then, remove
the build_arm/tslib-x.x/.stamp_build file.

Re-run make.

This topic is covered in Buildroot documentation, see
docs/buildroot.html.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
