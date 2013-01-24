From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 19:56:31 +0100
Subject: [Buildroot] [PATCH] gdb: Add support for gdb 7.5.1 and make it
 the default.
In-Reply-To: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
References: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
Message-ID: <510183DF.2060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/13 12:33, Will Newton wrote:
>   	prompt "GDB debugger Version"
>   	default BR2_GDB_VERSION_6_6 if BR2_bfin
>   	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32

  Not related but I see it now: does gdb 7.* actually work for avr32? If 
so, why do we keep this old version around?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
