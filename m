From: =?UTF-8?Q?Guillaume_s=C3=A9tan?= <setan.buildroot@gmail.com>
Date: Mon, 15 Jun 2015 11:54:20 +0200
Subject: [Buildroot]  Problem with package efl 1.14.1
Message-ID: <CALW-xeoh40gFPTU_zWeeOF+ZQLxE5-aN8KC1OiR_2ZsmVDXmsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to use the package EFL.1.14.1 with builbroot because I must use a
touch screen with a target arm (ZC706 EvaluationKIt  -- Zynq-7000Soc).


So, I find this version of buildroot make by Romain Naour (
https://github.com/RomainNaour/buildroot). But I haven't managed to run
this version with my settings, I spoke with Romain and even its settings
didn't work on my computer.

Please, can you explain me what tools are needed to compile buildroot ?

I try on virtual machine with Ubuntu and other computer with CentOs 7.


Sincerely,

Guillaume S?tan


-------------------------------------------------------------------------------------------------------------------------------------------------
Here are my settings :

---- Buildroot -------

Target : ZC706 EvaluationKit
  Zynq-7000Soc

Target arch : ARM (Little endian)
         Variant : Cortex - A9
Tollchain type : External toolchain
Tollchain : Sourcery Code Bench Arm 2014.05
Init System : Busy Box

--- Linux -----
To launch Buildroot
Linux 3.13.0-53 Ubuntu
-----------------------------------------------------------------------------------------------------------------------------

Link to my mistakes :
http://code.bulix.org/h4r426-88552

Link to my settings:
http://code.bulix.org/se58te-88553
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150615/a1a02f10/attachment.html>
