From: Bedran Atug <bedoo47@hotmail.de>
Date: Wed, 23 Jan 2019 23:46:12 +0000
Subject: [Buildroot] Docker.sock problem
Message-ID: <AM0PR04MB5699FBDFAB694D96AA1C990ECF990@AM0PR04MB5699.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I have created an image with Buildroot. I wanted to install Docker inside my image. All docker commands work, but when I start a docker container like docker run hello-world, I get the following problem: Cannot connect to the Docker daemon at unix:/var/run/docker.sock. Is the docker daemon running?
I already looked in the var/run/ directory but there is no docker.sock file there.
Can please anybody send me a defconfig file where Docker runs stable?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190123/74440beb/attachment.html>
