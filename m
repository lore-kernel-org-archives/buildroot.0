From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Mar 2018 17:36:57 -0300 (BRT)
Subject: [Buildroot] [PATCH] tpm2-tools: propagate dependencies of
 selected packages
In-Reply-To: <2128061294.712847.1521721325466.JavaMail.zimbra@datacom.ind.br>
References: <0bc695b6c1b76b30190ebddff065b6adb5d755f9.1521659099.git.baruch@tkos.co.il>
 <2128061294.712847.1521721325466.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1664919421.23363.1521751017850.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Baruch Siach" <baruch@tkos.co.il>
> Cc: "buildroot" <buildroot@busybox.net>
> Sent: Thursday, March 22, 2018 9:22:05 AM
> Subject: Re: [Buildroot] [PATCH] tpm2-tools: propagate dependencies of selected packages

>> From: "Baruch Siach" <baruch@tkos.co.il>
>> To: "buildroot" <buildroot@busybox.net>
>> Cc: "Baruch Siach" <baruch@tkos.co.il>, "Carlos Santos"
>> <casantos@datacom.ind.br>
>> Sent: Wednesday, March 21, 2018 4:04:59 PM
>> Subject: [PATCH] tpm2-tools: propagate dependencies of selected packages
> 
>> Fixes (libglib):
>> http://autobuild.buildroot.net/results/786/786859fccc477de1519d85d8a180626bb8ebe062/
>> http://autobuild.buildroot.net/results/df6/df6518f331c16b477c6e934914d0e56dc102c228/
[...]
> It needs C++ too, due to tpm2-tss. I'm already working on a patch to
> solve this problem.

Superseded by https://patchwork.ozlabs.org/patch/889621/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
