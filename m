From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:56:06 +0100
Subject: [Buildroot] [PATCH 09/16] zlib: enable compilation on the host
In-Reply-To: <5066eaf316f958a96d7034c7c2b7954609384914.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:43:00 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<5066eaf316f958a96d7034c7c2b7954609384914.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zl31i7s9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> zlib is needed on the host, to build xlib_libfontenc on the host, to
 Thomas> build xapp_mkfontscale on the host, in order to finally build xfonts
 Thomas> encodings on the target.

 
 Thomas>  $(eval $(call GENTARGETS,package,zlib))
 Thomas> +$(eval $(call GENTARGETS,package,zlib,host))
 Thomas> \ No newline at end of file

You forgot the trailing newline - Otherwise it looks good.

-- 
Bye, Peter Korsgaard
