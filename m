From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 17:30:28 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
In-Reply-To: <CAOR3GqV69iT1+1Qh3=j8MQygZGJApomnqB_xi1Hue3NrTRVTDA@mail.gmail.com>
 (Esben Haabendal's message of "Wed, 20 Mar 2019 16:03:16 +0100")
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
 <875zseitgs.fsf@dell.be.48ers.dk>
 <CAOR3GqXSxZw3m+OD3FLCFOR0Gi-v3zNJGe2+3Bhy7R6av7LVhQ@mail.gmail.com>
 <875zsdek04.fsf@dell.be.48ers.dk>
 <CAOR3GqU17TUskOwG_8DfwrcEt_AJcqzgD8=5j1c2Wa+LVveeSg@mail.gmail.com>
 <871s31ehot.fsf@dell.be.48ers.dk>
 <CAOR3GqV69iT1+1Qh3=j8MQygZGJApomnqB_xi1Hue3NrTRVTDA@mail.gmail.com>
Message-ID: <87sgvhcxuj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Haabendal <esbenhaabendal@gmail.com> writes:

 > Yes, you can use initrd=... if you provide the cmdline to the EFI stub.
 > But if you compile in the cmdline using CONFIG_CMDLINE, it will
 > not work, as it will only be available for Linux kernel, and not for
 > EFI stub.

I guess Even with CONFIG_CMDLINE, you could configure the boot entry to
pass initrd= to EFI, but OK.

-- 
Bye, Peter Korsgaard
