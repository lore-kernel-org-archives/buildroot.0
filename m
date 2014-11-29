From: Rainer Berns <rainer.berns@berns-online.de>
Date: Sat, 29 Nov 2014 18:25:12 +0100 (CET)
Subject: [Buildroot] buildroot 2014.11-rc3 mono fails
In-Reply-To: <CA+TH9Vn33sHoT3hju_mAMBDDJLfz5w7EVgutJrzPvTW=Wsti9A@mail.gmail.com>
References: <612310928.432121.1417205315374.JavaMail.open-xchange@oxbaltgw06.schlund.de>
 <CA+TH9V=Y7vf6r1nWmYcK3exEyDP7W=5N-VtaUae9sWs-UB3ZJQ@mail.gmail.com>
 <20141128223454.4a2cf327@free-electrons.com>
 <CA+TH9Vn33sHoT3hju_mAMBDDJLfz5w7EVgutJrzPvTW=Wsti9A@mail.gmail.com>
Message-ID: <1937789234.449812.1417281912237.JavaMail.open-xchange@oxbaltgw09.schlund.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,
 
removing of the external mono enviroment in ubuntu "fixes" the problem.
After using the latest git version with the  patch "force host-mono to use
internal mono bootstrap compiler "and reinstalled mono envirmoment  the
following error occured:
 
Mono.Http/NtlmClient.cs(99,26): error CS1502: The best overloaded method match
for `Mono.Security.Protocol.Ntlm.Type3Message.Type3Message(byte[])' has some
invalid arguments
/usr/lib/mono/2.0/Mono.Security.dll (Location of the symbol related to previous
error)
Mono.Http/NtlmClient.cs(99,44): error CS1503: Argument `#1' cannot convert
`Mono.Security.Protocol.Ntlm.Type2Message' expression to type `byte[]'

Regards
Rainer
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141129/68d0b95a/attachment.html>
