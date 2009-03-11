From: Hichem Boussetta <boussettahichem@yahoo.fr>
Date: Wed, 11 Mar 2009 10:26:30 +0100
Subject: [Buildroot] automated build of cross toolchains
Message-ID: <49B783C6.8070107@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am a newbie to buildroot, and I would like to know if it is possible 
to make the configuration process of buildroot automated.
I mean that, for example, if I wanted to build, in a batch mode, several 
cross toolchains for some specific architecturse that I would have 
defined beforehand, how should I proceed.
In fact, I thought about making a script that runs many times the "make 
config" command and that supplies the adequate configuration, but I 
don't think this is the best solution.
Is there any other solution like generating a default config by running 
"make config" and somehow modifying the .config file each time it is 
necessary in the script ?

If anyone got a solution, thanks for replying.

-- 
Hichem.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: boussettahichem.vcf
Type: text/x-vcard
Size: 295 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090311/ce4b2a8c/attachment.vcf>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3278 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090311/ce4b2a8c/attachment.bin>
