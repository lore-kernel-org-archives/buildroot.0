From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sat, 21 Mar 2015 09:34:15 -0700
Subject: [Buildroot] [PATCH 1/2] imx6sabresd: rename to imx6sabre
In-Reply-To: <550D8D41.3080504@mind.be>
References: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
 <550D8D41.3080504@mind.be>
Message-ID: <550D9D87.5000708@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 03/21/2015 08:24 AM, Arnout Vandecappelle wrote:
> On 20/03/15 18:41, Vincent Stehl? wrote:
>> Rename imx6sabresd board folder to imx6sabre, to prepare for Sabre Auto
>> addition. Update doc, link and defconfigs accordingly.
> 
>  One annoying thing: the SABRELite is quite different from the AI and SD, so the
> readme wouldn't be such a good fit for it. But that's a problem for whoever adds
> SABRELite :-)
> 

SABRELite is already present, though somewhat hidden.

The nitrogen6x board support contains support for SABRE Lite, since the
only real difference is added WiFi on Nitrogen6x:
	http://boundarydevices.com/differences-sabre-lite-nitrogen6x-and-som/

The boards run the same U-Boot and kernel, though they do have
different device trees.

Regards,


Eric
