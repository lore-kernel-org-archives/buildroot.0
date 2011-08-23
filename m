From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 15:06:48 +0200
Subject: [Buildroot] cyrus-sasl in buildroot: installs files
 with	"arm-linux-" prefix
In-Reply-To: <4E048B0A.8080003@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
 <4E048B0A.8080003@lucaceresoli.net>
Message-ID: <4E53A5E8.7080400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Alas, not all is perfect. While libraries look correctly installed, the
> manpages
> and executables are installed with an unwanted "arm-linux-" prefix:

I could fix this problem adding --program-prefix='' to the ./configure
options.

Thanks to Yann for having unconsciously led me to the solution
(http://lists.busybox.net/pipermail/buildroot/2011-July/044757.html).

Luca
