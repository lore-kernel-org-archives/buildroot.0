From: Rainer Berns <rainer.berns@berns-online.de>
Date: Fri, 28 Nov 2014 21:08:35 +0100 (CET)
Subject: [Buildroot] buildroot 2014.11-rc3  mono fails
Message-ID: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
I try to build mono with beaglebone_defconfig, internal toolchain (3.12.10
headers) with IPv6 and WCHAR.
Building mono 4.5 ,4 and  2/3   fails with :
 
Mono.Http/NtlmClient.cs(99,54): error CS1502: The best overloaded method match
for `Mono.Security.Protocol.Ntlm.Type3Message.Type3Message(byte[])' has some
invalid arguments
/usr/lib/mono/gac/Mono.Security/2.0.0.0__0738eb9f132ed756/Mono.Security.dll
(Location of the symbol related to previous error)
Mono.Http/NtlmClient.cs(99,54): error CS1503: Argument `#1' cannot convert
`Mono.Security.Protocol.Ntlm.Type2Message' expression to type `byte[]'
make[10]: *** [../../class/lib/basic/secxml/System.dll] Error 1
make[9]: *** [../../class/lib/basic/secxml/System.dll] Error 2
make[8]: *** [do-all] Error 2
make[7]: *** [all-recursive] Error 1
make[6]: *** [all-recursive] Error 1
make[5]: *** [profile-do--basic--all] Error 2
make[4]: *** [profiles-do--all] Error 2
make[3]: *** [all-local] Error 2
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make: ***
[/home/berns/Entwicklung/buildroot-2014.11-rc3/output/build/host-mono-3.10.0/.stamp_built]
Error 2

 
Regards
 
Rainer
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141128/ee1ef127/attachment.html>
