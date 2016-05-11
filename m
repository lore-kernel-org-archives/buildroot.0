From: daggs <daggs@gmx.com>
Date: Wed, 11 May 2016 22:32:25 +0200
Subject: [Buildroot] dependencies calcualtion
Message-ID: <trinity-e1cc7e5a-9d9e-4d12-8e74-34995cf3d68f-1462998745265@3capp-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I got a question, how does a package knows of it's dependencies?
for example, kodi needs libgles, lets assume that I'm using sunxi-mali which provides gles.
how does buildroot know to compile sunxi-mali before it compiles kodi?

Thanks.
