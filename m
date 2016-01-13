From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 13 Jan 2016 19:34:28 -0200
Subject: [Buildroot] [RFC PATCH v2 0/4] package/dhcp
Message-ID: <5696c2e46d700_16baf34c4c4499@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Doug,

On Sun, 10 Jan 2016 15:25:05 -0600, Doug Kehn wrote:
> This patch series bumps dhcp package to 4.3.3. I'm doing this as an RFC to get
[snip]

There is a new release for isc-dhcp from yesterday. It's a security update.

https://kb.isc.org/article/AA-01334/0/CVE-2015-8605%3A-UDP-payload-length-not-properly-checked.html
DHCP version 4.1-ESV-R12-P1
DHCP version 4.3.3-P1

IMO we should have a new version of the patch series before committing it.

Regards,
Ricardo
