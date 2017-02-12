From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 12 Feb 2017 13:02:23 -0200 (BRST)
Subject: [Buildroot] [PATCH v5] gtest/gmock: bump to version 1.8.0
In-Reply-To: <20170212153749.7f9aff72@free-electrons.com>
References: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
 <c410065bcf02dbf9548965118905fb4e0edfcc40.1486901824.git.casantos@datacom.ind.br>
 <20170212153749.7f9aff72@free-electrons.com>
Message-ID: <116271.9983971.1486911743876.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Fabrice Fontaine" <fabrice.fontaine@orange.com>, "romain naour" <romain.naour@gmail.com>,
> "yann morin 1998" <yann.morin.1998@free.fr>
> Sent: Sunday, February 12, 2017 12:37:49 PM
> Subject: Re: [Buildroot] [PATCH v5] gtest/gmock: bump to version 1.8.0

> Hello,
> 
> On Sun, 12 Feb 2017 10:17:27 -0200, Carlos Santos wrote:
> 
>> +define HOST_GTEST_INSTALL_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>> +		$(HOST_DIR)/usr/bin/gmock_gen.py
>> +	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
> 
> Is there a good reason to not install directly gmock_gen.py as
> gmock_gen ?

IIRC some of out tests build calling gmock_gen.py and other calling gmock_gen
but I need to check that tomorrow, at office. Right now I'm at home, without
access to that code.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
