From: Magnus Armholt <magnus.armholt@wapice.com>
Date: Thu, 15 Oct 2020 04:31:11 +0000
Subject: [Buildroot] pkg-stats support for external tree?
Message-ID: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
We are using a setup with an external tree holding our specific packages (br2_external).
The renewed pkg-stats is a nice tool and we would like to cover also our specific packages in br2_external.
Is this possible?

I tried running the pkg-stats from our base directory (parent of buildroot) but this fails due to how the utils/getdeveloperlib is included.

Our directory layout

project-base/
| - buildroot/
| - br2_external/
     | - board/
     | - configs/
     | - Config.in
     | - external.desc
     | - external.mk
     | - package/
| - local_site/

BR,
Magnus

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201015/5d4300da/attachment.html>
