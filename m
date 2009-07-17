From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Jul 2009 01:21:32 +0200
Subject: [Buildroot] [PATCH 06/13] dillo: remove configuration comment
	on X.org dependency
In-Reply-To: <ca40dacf64bf75389ac16f06b7c79bd67c8c9a3d.1247846597.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	17 Jul 2009 18\:03\:13 +0200")
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<ca40dacf64bf75389ac16f06b7c79bd67c8c9a3d.1247846597.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zlb2hp4z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Configuration comments make the configuration system
 Thomas> messy. And if we want to tell the user about the possible
 Thomas> missing depencies for each and every package, there would be
 Thomas> an unmaintable mess of configuration comments.

 Thomas> Let's get rid of them, and let the user figure out using the
 Thomas> help of each package available in the configuration system.

Please change the 'depends on' lines for the libraries to 'select'
then.

-- 
Bye, Peter Korsgaard
