From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2020 23:54:53 +0200
Subject: [Buildroot] Clone from HTTPS URL gave error 403
In-Reply-To: <20200519233717.3c67061e@windsurf.home> (Thomas Petazzoni's
 message of "Tue, 19 May 2020 23:37:17 +0200")
References: <BYAPR11MB2552D7A18E88F73937B9C79CFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
 <20200519232150.29ce6381@windsurf.home>
 <BYAPR11MB25521F0F00DD12650720FE9BFAB90@BYAPR11MB2552.namprd11.prod.outlook.com>
 <20200519233717.3c67061e@windsurf.home>
Message-ID: <87blmjmvyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 19 May 2020 21:34:48 +0000
 > "Hsiao, Michael" <michael.hsiao@intel.com> wrote:

 >> Hello Thomas,
 >> 
 >> Here's the URL I used: https://git.busybox.net/buildroot
 >> 
 >> This is the error from Git Bash on Friday:
 >> $ git clone https://git.busybox.net/buildroot
 >> Cloning into 'buildroot'...
 >> fatal: unable to access 'https://git.busybox.net/buildroot/': The requested URL returned error: 403

 > I know there's been recently some sysadmin work done on the server that
 > hosts our Git server, that might explain it.

 > As I said, you can also use https://github.com/buildroot/buildroot.

This was unfortunately an issue introduced when smart mirroring over
HTTP was added. It should be fixed again now.

-- 
Bye, Peter Korsgaard
