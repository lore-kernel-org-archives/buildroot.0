From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 01 Feb 2018 08:54:13 +0100
Subject: [Buildroot] linux-firmware: wrong sha256 hash
In-Reply-To: <20180131185016.3diheii3anpqrymi@tarshish>
References: <1517417554.32426.6.camel@embedded.rocks>
 <20180131185016.3diheii3anpqrymi@tarshish>
Message-ID: <1517471653.2404.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch

On Wed, 2018-01-31 at 20:50 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Wed, Jan 31, 2018 at 05:52:34PM +0100, J?rg Krause wrote:
> > looks like the hashes for the linux-firmware git repository have
> > changed:
> 
> It seem like you were probably bitten by the --numeric-owner behaviour change 
> in tar version 1.30. See the thread starting at:
> 
>   http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html

Thanks! I somehow missed that discussion.
J?rg
