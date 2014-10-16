From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 12:02:25 +0200
Subject: [Buildroot] [PATCH 1/3] package/squid: enable ICAP server
 support in squid and define logdir, pidfile and swapdir
In-Reply-To: <543F9553.1000204@oliseo.fr>
References: <1411032426-11463-1-git-send-email-guillaume.gardet@oliseo.fr>
 <1411032426-11463-2-git-send-email-guillaume.gardet@oliseo.fr>
 <20141005235232.66d3c09c@free-electrons.com>
 <5435988F.70209@oliseo.fr>
 <20141008221807.3b9e147d@free-electrons.com>
 <54359D66.3000608@zacarias.com.ar> <543F9553.1000204@oliseo.fr>
Message-ID: <20141016120225.3a8204e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guillaume GARDET - Olis?o,

On Thu, 16 Oct 2014 11:52:19 +0200, Guillaume GARDET - Olis?o wrote:

> Then, should I make it optionnal or not? I think it should be ok to
> keep it included as it will never be used on underpowered SoC.
> 
> Thomas, would you be ok with that?

Yes, fair enough, keeping it always enabled is fine with me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
