From: Christian Stewart <christian@paral.in>
Date: Mon, 04 Jul 2016 20:15:19 +0000
Subject: [Buildroot] [PATCH v6 2/5] docker-containerd: new package
In-Reply-To: <3b168205-edc7-5479-d4a3-d4ac8497be8f@gmail.com>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
 <1467660382-6317-2-git-send-email-christian@paral.in>
 <3b168205-edc7-5479-d4a3-d4ac8497be8f@gmail.com>
Message-ID: <1467663319312-27bbc542-6b053e52-65141ee8@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,


On Mon, Jul 4, 2016 1:13 PM, Romain Naour romain.naour at gmail.com wrote:Missing comment about the runtime dependency.


I swear I added it - must have been lost somewhere in my git tree.
Why this ?docker-? prefix is required ? (sorry I don't know much docker)


That's just the name of the project (docker-containerd) and also the name the
main docker daemon expects for the executable.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160704/585d14bd/attachment.html>
