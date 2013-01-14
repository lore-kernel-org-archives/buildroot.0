From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 16:35:53 +0100
Subject: [Buildroot] [PATCH 1/2] Integration with Buildroot Toolchain
	Eclipse plugin
In-Reply-To: <1358088734-23460-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 13 Jan 2013 15:52:13 +0100")
References: <1358088734-23460-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358088734-23460-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2x7srom.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The Eclipse plugin at
 Thomas> https://github.com/mbats/eclipse-buildroot-toolchain-plugin allows
 Thomas> users of Eclipse to easily use the toolchain available in
 Thomas> Buildroot. To do so, this plugin reads
 Thomas> ~/.buildroot-eclipse.toolchains, which contains the list of Buildroot
 Thomas> toolchains available on the system, and then offer those toolchains to
 Thomas> compile Eclipse projects.

 Thomas> In order to interface with this plugin, this commit adds an option
 Thomas> that allows the user to tell whether (s)he wants the Buildroot project
 Thomas> toolchain to be visible under this Eclipse plugin. It simply adds a
 Thomas> line in this ~/.buildroot-eclipse.toolchains file.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> +++ b/support/scripts/eclipse-register-toolchain
 Thomas> @@ -0,0 +1,28 @@
 Thomas> +#!/bin/sh
 Thomas> +
 Thomas> +project_directory=$1
 Thomas> +toolchain_prefix=$2
 Thomas> +architecture=$3

Committed, thanks. I know this is an internal script, but a bit of
documentation / argument checking could have been good.

-- 
Bye, Peter Korsgaard
