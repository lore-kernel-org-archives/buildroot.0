From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 May 2016 07:33:32 -0300
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <20160509232119.668c0b36@free-electrons.com>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
 <20160509232119.668c0b36@free-electrons.com>
Message-ID: <5731B8FC.8070403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/16 18:21, Thomas Petazzoni wrote:

> Enabling autoreconf and gettextize was added when
> 0001-Add-configure-option-to-disable-documentation.patch was added by
> Gustavo. So I would assume that they could now be removed.
>
> However, it turns out that rrdtool 1.6.0 doesn't build without
> autoreconf+gettextize, I'm not sure why. In any case, the comment
> should be updated and not removed.
>
> I'm Cc'ing Gustavo who originally added the patch.
>
> Thanks,
>
> Thomas

Hi all.
What's the failure you're seeing by dropping autoreconf/gettextize?
On my end it seems to build just fine.
Regards.
