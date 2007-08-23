From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 23 Aug 2007 13:37:12 +0200
Subject: [Buildroot] Latest Makefile.autotools.in
	breaks	x11r7-compilation.
In-Reply-To: <f90898420708230254j52eb3de8g258b4fadbabfa9e9@mail.gmail.com>
References: <f90898420708230254j52eb3de8g258b4fadbabfa9e9@mail.gmail.com>
Message-ID: <20070823113703.GL11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 23, 2007 at 11:54:42AM +0200, Simon Pasch wrote:
>Building stops with:
>>>> libxcb 1.0 Extracting
>
>/bin/sh: line 1: @tar: command not found

This and the typo "DEPENDANCIES" are now fixed (r19666). Thanks for the
notice.
