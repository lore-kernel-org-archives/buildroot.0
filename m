From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 20:37:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 to version 20180108
In-Reply-To: <20180109185556.28854-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 9 Jan 2018 19:55:56 +0100")
References: <20180109185556.28854-1-bernd.kuhls@t-online.de>
Message-ID: <87inc1fvcc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Quoting releasenote:
 > "Intel Processor Microcode Package for Linux
 > 20180108 Release

 > -- Updates upon 20171117 release --
 > IVT C0          (06-3e-04:ed) 428->42a
 > SKL-U/Y D0      (06-4e-03:c0) ba->c2
 > BDW-U/Y E/F     (06-3d-04:c0) 25->28
 > HSW-ULT Cx/Dx   (06-45-01:72) 20->21
 > Crystalwell Cx  (06-46-01:32) 17->18
 > BDW-H E/G       (06-47-01:22) 17->1b
 > HSX-EX E0       (06-3f-04:80) 0f->10
 > SKL-H/S R0      (06-5e-03:36) ba->c2
 > HSW Cx/Dx       (06-3c-03:32) 22->23
 > HSX C0          (06-3f-02:6f) 3a->3b
 > BDX-DE V0/V1    (06-56-02:10) 0f->14
 > BDX-DE V2       (06-56-03:10) 700000d->7000011
 > KBL-U/Y H0      (06-8e-09:c0) 62->80
 > KBL Y0 / CFL D0 (06-8e-0a:c0) 70->80
 > KBL-H/S B0      (06-9e-09:2a) 5e->80
 > CFL U0          (06-9e-0a:22) 70->80
 > CFL B0          (06-9e-0b:02) 72->80
 > SKX H0          (06-55-04:b7) 2000035->200003c
 > GLK B0          (06-7a-01:01) 1e->22"

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
