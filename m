From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 17 Dec 2007 20:05:03 +0100
Subject: [Buildroot] tree cleanup after 'svn up'
References: <c166aa9f0712170851p39dbcf6as4b9f1f63e4dff5e@mail.gmail.com>
Message-ID: <037401c84104$b06542c0$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

| Is there a recommended proceedure for resetting things in the tree
| after doing an svn update?  If not it would be nice to have a make
| target for that.
|

$make menuconfig
 with a save...

Best Regards
Ulf Samuelsson
