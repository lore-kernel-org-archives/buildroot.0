From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 04 Aug 2015 09:43:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-03
In-Reply-To: <20150804063017.1618610249D@stock.ovh.net>
References: <20150804063017.1618610249D@stock.ovh.net>
Message-ID: <1438674211.2172.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2015-08-04 at 08:30 +0200, Thomas Petazzoni wrote:

>      powerpc | libsigrok-fe473123ba836445d... | NOK | 
> http://autobuild.buildroot.net/results/ffc0a73012ca63f26b05bd04162a8c
> d5cbe0b1cf/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuil
> d.buildroot.net/results/1f348d86f6c591bed66320878b0fb8bae3d213cd/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuil
> d.buildroot.net/results/563378e3f6320980153c8c972ceba5e913fe933f/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuil
> d.buildroot.net/results/1d75497009f1e3b06236b3409fd768dcf7956b87/

Too old toolchains not understand `-std=c11`. I'll prepare a patch for
this.

Best regards
J?rg Krause
