From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 20:19:21 +0200
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <53CD400B.1070106@zacarias.com.ar>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
 <1405951937-21226-2-git-send-email-jkrause@posteo.de>
 <20140721162558.749a1393@free-electrons.com>
 <53CD400B.1070106@zacarias.com.ar>
Message-ID: <20140721201921.35334933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jul 2014 13:30:03 -0300, Gustavo Zacarias wrote:
> On 07/21/2014 11:25 AM, Thomas Petazzoni wrote:
> 
> > That being said, I would prefer to find a different name for the mpc
> > package (mpd client) rather than renaming existing packages.
> 
> +1
> Renaming it is potentially very problematic for people that use mpc
> (multiprecision library) for their own projects, mpc would be a
> completely different thing now and we can't make it legacy either since
> there would be a new mpc.
> Just call it mpclient and use a different bool IMHO.

Agreed. "mpclient" sounds like a good alternative.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
