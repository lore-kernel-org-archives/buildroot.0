From: Bedran Atug <bedoo47@hotmail.de>
Date: Mon, 21 Jan 2019 14:35:48 +0000
Subject: [Buildroot] (no subject)
Message-ID: <AM6PR04MB5701AFB27FC290303F6D801ECF9F0@AM6PR04MB5701.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have created an image with Buildroot. I wanted to install Docker inside my image. All docker commands work, but when I start a docker container like docker run hello-world, I get the following problem: Cannot connect to the Docker daemon at unix:/var/run/docker.sock. Is the docker daemon running?
I already looked in the var/run/ directory but there is no docker.sock file there.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190121/d4074b59/attachment.html>
