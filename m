From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:04:45 +0200
Subject: [Buildroot] Lightweight method for handling external power-down
 request
In-Reply-To: <CAF_dkJCO5r0Se08Pr6pAv=u-esPSFMR68V01=DHLSeHn0q2oTw@mail.gmail.com>
References: <CAF_dkJCO5r0Se08Pr6pAv=u-esPSFMR68V01=DHLSeHn0q2oTw@mail.gmail.com>
Message-ID: <20160419210445.35d66eb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 14:15:10 -0400, Patrick Doyle wrote:

> So, how do ARM folks in Buildroot-land handle this?

Look at the input-event-daemon package in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
