From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Mar 2019 08:24:33 +0100
Subject: [Buildroot] [PATCH v7 0/8] Top-level parallel build support
In-Reply-To: <20190301171803.GD2721@scaer>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228182159.02a8a6c4@windsurf>
 <1e8db4c8-8bd4-d47a-ae39-a2d461a49672@andin.de>
 <CAMw6YJL9ciuU=tScsbV3rqH1KFd+OaPn6jN+DrUDqTdLizqQCA@mail.gmail.com>
 <20190222212912.727ff0c2@windsurf>
 <20190225011003.g7j35hly5bpf2bys@vkochan-ThinkPad-T470p>
 <20190225090543.1e93d3a6@windsurf.home>
 <20190301145043.GA20576@lwo1-lhp-f71841> <20190301171803.GD2721@scaer>
Message-ID: <3f0c64cc-c73e-e9d3-ff79-e1ba91041f00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/03/2019 18:18, Yann E. MORIN wrote:
> However, we eventually concluded that this was not going to work
> reliably, so we decided against at that time. I could not find that
> conclusion in the devdays meeting reports, so I guess it's burried
> somewhere in the mailing list. I'll try to unearth those later in the
> evening or the week-end...

 If I remember correct, didn't GNU make bypass the SHELL variable for simple
commands?

 Regards,
 Arnout
