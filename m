From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Wed, 23 Nov 2011 10:24:30 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <4ECB795E.90607@neotion.com>
References: <4ECA36CB.5010803@neotion.com> <1321879312.2085.18.camel@sven>
 <20111121134405.02151918@skate> <4ECA8C28.1020306@neotion.com>
 <20111121210817.5eddecc0@skate> <4ECB795E.90607@neotion.com>
Message-ID: <4ECCBBCE.8090907@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 11/22/2011 11:28 AM, Emmanuel BOUAZIZ wrote:
> uhci_hcd 0000:00:1d.2: PCI INT C -> Link[LNKC] -> GSI 7 (level, low) -> IRQ 7
> uhci_hcd 0000:00:1d.2: UHCI Host Controller
> uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
> uhci_hcd 0000:00:1d.2: irq 7, io base 0x0000f040
> 
> there are 4 of them, 2 of which use IRQ 11 and the last one IRQ 10.
> 
> The UHCI driver is selected in linux's configuration.
> 
> regards,
> 

Hi,

I'm not sure why but the problem dissapeared after I enabled Sparse IRQ numbering (and DMA)

Thanks for your help,

-- 
Emmanuel
