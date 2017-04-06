From: Matt Flax <flatmax@flatmax.org>
Date: Thu, 6 Apr 2017 18:12:39 +1000
Subject: [Buildroot] [aarch64] can't handle reloc type error
Message-ID: <ceee635f-4c82-2e20-9c23-15b163bc5331@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

I am building buildroot for aarch64. I am using the s5p6818 system.
The system builds and boots well.

The problem I am having is that any packages which are in my external 
directory $BR2_EXTERNAL_CUSTOM_PATH doesn't produce executable executables.

If I try to run something which was sourced from the buildroot package 
directory, it works well.

If I try to run an executable from my custom external package path, it 
doesn't. I get the following error :

/usr/bin/testit symbol '_ZSt15__once_callable': can't handle reloc type 
0x407

Anyone got any ideas on what to do ?

thanks
Matt
