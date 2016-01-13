From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 13 Jan 2016 16:38:27 -0600
Subject: [Buildroot] [RFC PATCH v2 0/4] package/dhcp
In-Reply-To: <5696c2e46d700_16baf34c4c4499@ultri2.mail>
References: <5696c2e46d700_16baf34c4c4499@ultri2.mail>
Message-ID: <20160113223827.GA14232@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richardo,

On Wed, Jan 13, 2016 at 07:34:28PM -0200, Ricardo Martincoski wrote:
> Hi Doug,
> 
> On Sun, 10 Jan 2016 15:25:05 -0600, Doug Kehn wrote:
> > This patch series bumps dhcp package to 4.3.3. I'm doing this as an RFC to get
> [snip]
> 
> There is a new release for isc-dhcp from yesterday. It's a security update.
> 
> https://kb.isc.org/article/AA-01334/0/CVE-2015-8605%3A-UDP-payload-length-not-properly-checked.html
> DHCP version 4.1-ESV-R12-P1
> DHCP version 4.3.3-P1
> 
> IMO we should have a new version of the patch series before committing it.

Agree, thanks.

Does the series need to retain the RFC tag, or is the handling of
the embedded bind tar-ball acceptable?

Regards,
...doug
