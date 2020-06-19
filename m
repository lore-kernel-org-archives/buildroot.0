From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 19 Jun 2020 11:01:34 -0300
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <20200619135929.GA529674@p1g2>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
 <d6c168ae-abe9-26ba-f8f8-d62687ff2592@armadeus.com>
 <20200619132043.GA525498@p1g2>
 <6b4eda2b-4095-0c6d-fd6f-b5e0ca483603@armadeus.com>
 <20200619135929.GA529674@p1g2>
Message-ID: <CAOMZO5Ae-h_yFo9qHhJMeOvFi=Bw2FX9JCm9Vyf1LaiQGgr3Bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 19, 2020 at 10:59 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Your title says "add SDMA firmware for i.MX8M" but in the end it also
> installs VPU and EPDC files.

Agreed. Yes, this was the exact point that called my attention when I
reviewed this patch.
