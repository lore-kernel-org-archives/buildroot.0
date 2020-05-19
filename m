From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2020 23:37:17 +0200
Subject: [Buildroot] Clone from HTTPS URL gave error 403
In-Reply-To: <BYAPR11MB25521F0F00DD12650720FE9BFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
References: <BYAPR11MB2552D7A18E88F73937B9C79CFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
 <20200519232150.29ce6381@windsurf.home>
 <BYAPR11MB25521F0F00DD12650720FE9BFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
Message-ID: <20200519233717.3c67061e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 May 2020 21:34:48 +0000
"Hsiao, Michael" <michael.hsiao@intel.com> wrote:

> Hello Thomas,
> 
> Here's the URL I used: https://git.busybox.net/buildroot
> 
> This is the error from Git Bash on Friday:
> $ git clone https://git.busybox.net/buildroot
> Cloning into 'buildroot'...
> fatal: unable to access 'https://git.busybox.net/buildroot/': The requested URL returned error: 403

I know there's been recently some sysadmin work done on the server that
hosts our Git server, that might explain it.

As I said, you can also use https://github.com/buildroot/buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
