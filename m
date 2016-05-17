From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 17 May 2016 20:44:03 +0200
Subject: [Buildroot] New pre-built Buildroot toolchains in the
	autobuilder
In-Reply-To: <20160517151217.045c17c4@free-electrons.com>
References: <20160517151217.045c17c4@free-electrons.com>
Message-ID: <573B6673.70203@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 17.05.2016 um 15:12 schrieb Thomas Petazzoni:
> Hello,
> 
> I have just rebuilt and deployed all the pre-built Buildroot external
> toolchains used on the autobuilders with Buildroot 2016.05-rc1. Most
> notably, this should fix numerous build failures of the 'mpv' package,
> which are due to missing support for XSI math in uClibc (it has been
> enabled in the uClibc configuration recently).
> 
Hi, http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv needs an update
e.g. the line http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config
that file gives a 404
that breaks my autobuild task
