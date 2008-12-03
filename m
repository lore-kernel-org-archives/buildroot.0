From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 3 Dec 2008 07:15:43 +0100
Subject: [Buildroot] [PATCH 1/7 v2] package: add liboil package
In-Reply-To: <20081202235149.553ef881@surf>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200811190249.29428.markus.heidelberg@web.de>
	<200811250827.15650.markus.heidelberg@web.de>
	<20081202235149.553ef881@surf>
Message-ID: <20081203071543.10c94e99@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2 Dec 2008 23:51:49 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Tue, 25 Nov 2008 08:27:15 +0100,
> Markus Heidelberg <markus.heidelberg@web.de> a ?crit :
> 
> > "select BR2_PACKAGE_LIBGLIB2" was missing in the previous patch.
> 
> It seems that Glib2 is only needed to compile the example programs of
> liboil. Maybe we could disable building of the examples and get rid of
> the Glib2 dependency ?
> 

That should not be impossible, often just a switch to ./configure.

-- 
Best regards,
Hans-Christian Egtvedt
