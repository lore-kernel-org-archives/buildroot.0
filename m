From: Hsiao, Michael <michael.hsiao@intel.com>
Date: Tue, 19 May 2020 21:34:48 +0000
Subject: [Buildroot] Clone from HTTPS URL gave error 403
In-Reply-To: <20200519232150.29ce6381@windsurf.home>
References: <BYAPR11MB2552D7A18E88F73937B9C79CFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
 <20200519232150.29ce6381@windsurf.home>
Message-ID: <BYAPR11MB25521F0F00DD12650720FE9BFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Here's the URL I used: https://git.busybox.net/buildroot

This is the error from Git Bash on Friday:
$ git clone https://git.busybox.net/buildroot
Cloning into 'buildroot'...
fatal: unable to access 'https://git.busybox.net/buildroot/': The requested URL returned error: 403

Thanks,
Michael

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Tuesday, May 19, 2020 2:22 PM
To: Hsiao, Michael <michael.hsiao@intel.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] Clone from HTTPS URL gave error 403

Hello Michael,

On Tue, 19 May 2020 21:07:53 +0000
"Hsiao, Michael" <michael.hsiao@intel.com> wrote:

> I was getting an error 403 when I tried to git clone from the 
> recommended HTTPS URL last week, but now it seems to be working again. 
> What's the best way to get notified or check if there is downtime?

Could you indicate which URL specifically you've tried?

In any case, keep in mind that we have a mirror on Github, which is updated from the official repository every 10 minutes.

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
