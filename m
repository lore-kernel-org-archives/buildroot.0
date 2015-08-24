From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 25 Aug 2015 00:15:38 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <55DB7994.8080509@mind.be>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com> <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com> <55DB7994.8080509@mind.be>
Message-ID: <55DB978A.3050805@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 10:07 PM, Arnout Vandecappelle wrote:
> I registered (under a false name and with a dummy e-mail address) and
> downloaded the driver, and there is no license text available in it. I also did
> not have to agree to any license conditions in order to register or download
> anything. So either this representative is wrong about "does not allow
> redistributing without licensing conditions", or the website designer botched
> it. Probably the latter. Bottom line is: unless you have a separate agreement
> with Bluegiga, you are not allowed to use this software for any purpose. I don't
> understand how legal departments can let something like this pass but on the
> other hand get all excited about some piece of GPLv3 in your product...
>
>   The source code says "Refer to LICENSE.txt included with this source code for
> details on the license terms.", but LICENSE.txt is missing. An earlier version
> of the tarball has a LICENSE.txt with a MIT-like license or GPLv2. But anyway,
> that obviously only applies to the sources, not to the userspace binaries that
> are included and much less to the firmware blobs. So we probably can't host a
> copy on sources.buildroot.org.

Although not necessarily a version that works with this device, source 
for the unifi_helper program doesn't seem to be that hard to find either.

https://github.com/kk30/A10-Linux-2.6.36/tree/master/modules/wifi/apm/unifi-linux
license.txt suggests everything is dual licensed MIT and GPLv2

So wonder if it is really the chip vendor being the problem...


Yours sincerely,

Floris Bos
