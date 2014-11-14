From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 10:54:21 -0300
Subject: [Buildroot] [PATCH 08/10] dhcp: update dhclient-script
In-Reply-To: <20141114141904.4bfa5f21@free-electrons.com>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>	<1415969096-3032-9-git-send-email-gustavo@zacarias.com.ar>
 <20141114141904.4bfa5f21@free-electrons.com>
Message-ID: <5466098D.6060108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/14/2014 10:19 AM, Thomas Petazzoni wrote:

> I think we want a comment here that tells where the script is coming
> from (URL, license, etc.).

I'll add the source.
The license is a bit beneath my abilities, OpenWRT is GPLv2, however the
majority of dhclient-scripts are shipped/based on the ones bundled in
ISC dhcp which is ISC license (not up to date because of an older dhcp
version, in clients/scripts/openwrt for example).
So what would that make it?
Regards.
