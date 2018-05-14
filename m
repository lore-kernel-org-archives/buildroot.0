From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 14 May 2018 01:00:02 -0300
Subject: [Buildroot] [PATCH 5/8] janus-gateway: rename options to have
 proper prefix
References: <20180513190737.26079-6-thomas.petazzoni@bootlin.com>
Message-ID: <5af909c299d5_3efa3fd79e064b8074891@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, May 13, 2018 at 04:07 PM, Thomas Petazzoni wrote:

> -config  BR2_PACKAGE_JANUS_STREAMING
> +config  BR2_PACKAGE_JANUS_GATEWAY_STREAMING

Could we remove the extra space after 'config' in the same patch?
It can be done while applying.

I checked and this is the only occurrence in the tree.
$ grep 'config  ' $(find * -name 'Config.*')


Regards,
Ricardo
