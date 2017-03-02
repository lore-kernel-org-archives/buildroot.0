From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 2 Mar 2017 08:34:24 -0300 (BRT)
Subject: [Buildroot] [PATCH v7] gtest/gmock: bump to version 1.8.0
In-Reply-To: <20170301230927.11de82b6@free-electrons.com>
References: <1487070316-12583-1-git-send-email-casantos@datacom.ind.br>
 <1487784452-7424-1-git-send-email-casantos@datacom.ind.br>
 <20170226150525.359a21cf@free-electrons.com>
 <802529421.12331306.1488198710194.JavaMail.zimbra@datacom.ind.br>
 <20170301230927.11de82b6@free-electrons.com>
Message-ID: <201605192.12649135.1488454464199.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: "Fabrice Fontaine" <fabrice.fontaine@orange.com>, "Romain Naour" <romain.naour@gmail.com>, "Yann E. MORIN"
> <yann.morin.1998@free.fr>, buildroot at buildroot.org
> Sent: Wednesday, March 1, 2017 7:09:27 PM
> Subject: Re: [Buildroot] [PATCH v7] gtest/gmock: bump to version 1.8.0

> Hello,
> 
> On Mon, 27 Feb 2017 09:31:50 -0300 (BRT), Carlos Santos wrote:
> 
>> Because it does not work (try http://patchwork.ozlabs.org/patch/727786/).
> 
> Could you define "does not work" ? Indeed, I applied this version of
> your patch (v6), and built it with the following configurations:
> 
> BR2_PACKAGE_GTEST=y
> # BR2_PACKAGE_GTEST_GMOCK is not set
> 
> and:
> 
> BR2_PACKAGE_GTEST=y
> BR2_PACKAGE_GTEST_GMOCK=y
> 
> and both built successfully.

Hum, that's correct. I'm at work now, without access to the machine in
which I was running my tests, at home, and can't reproduce the problem
that led me to believe that v7 was necessary. Looks like it was just a
mistake.

Please apply v6 and discard v7. Sorry for the noise.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
