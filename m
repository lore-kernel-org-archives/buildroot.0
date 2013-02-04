From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Feb 2013 23:16:42 +0100
Subject: [Buildroot] Error in oprofile build
In-Reply-To: <1359984608.78532.YahooMailNeo@web194602.mail.sg3.yahoo.com>
References: <1359984608.78532.YahooMailNeo@web194602.mail.sg3.yahoo.com>
Message-ID: <5110334A.5040405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/13 14:30, kumar sarma wrote:
> Hi,
> We are using the 2.6.32.42 kernel, uclibc on mips platform. When i tried
> to compile the oprofile i am getting the following error.
> /staging_dir/target-mips_r2_uClibc-0.9.30.1_arx388_rt_he_adsl_mlcnand_smp_sample/usr/lib/libopcodes-2.19.1.so
> not found.
> But i am able to locate the libopcodes.a in the library path but not the .so.
> Can some one help on how to generate a .so for libopcodes which will come
> as a part of binutils.

  Is it possible that you have BR2_PREFER_STATIC selected? Then binutils 
will be built without .so files, I think.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
