From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 24 Jan 2007 17:25:50 +0100
Subject: [Buildroot] mtd broken with 2.6.19 headers
In-Reply-To: <BAY124-W223C68B2C8461BEC697DF0DCAA0@phx.gbl>
References: <BAY124-W223C68B2C8461BEC697DF0DCAA0@phx.gbl>
Message-ID: <20070124162550.GA13003@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 18, 2007 at 08:34:50AM +0000, Daniel Laird wrote:
>I myself ran into this problem. (yesterday)
> 
>Please find attached the mtd.mk file and the mtd patch file.  This seemed to build fine with the 2.6.19.2 headers in buildroot.
> 
>The patch was based on a patch that was on internet, and i believe is now in mainline for mtd but no newer release yet with it in. 
> 
>Hope this helps (and gets in to mainline)

Ulf, can you please check if that fixes mtd for you and if so, send a
svn diff package/mtd that i can apply?

Thanks in advance,
