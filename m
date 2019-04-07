From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Apr 2019 08:36:05 +0200
Subject: [Buildroot] [RFC 1/1] support/kconfig: Allow to override
 'default' config property
In-Reply-To: <20190407062440.GG2659@scaer> (Yann E. MORIN's message of "Sun, 7
 Apr 2019 08:24:40 +0200")
References: <20190407001006.12925-1-vadim4j@gmail.com>
 <20190407062440.GG2659@scaer>
Message-ID: <871s2emiei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Really, the defconfig *is* the place where defaults are overriden.

 > For example, at work, I handle a single br2-external for two "projects"
 > that each have four "boards", and each have three configurations. There
 > is no way your proposal can cover this.

 > Alternatively, what you propose is just pushing the feature of a
 > defconfig into the language itself. I don't think this is a good idea.
 > Even more so, as your proposal does not address all the cases either:
 > it only catters for strings, but what about choices, tri-states?

 > So, I'll be harsh, but NAK.

FWIW, I completely agree with Yanns points. Having two ways of
configuring this (defconfigs and br2-external trees) makes things more
complicated for little added value.

-- 
Bye, Peter Korsgaard
