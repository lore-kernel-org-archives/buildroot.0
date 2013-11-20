From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 09:21:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-19
In-Reply-To: <CAAXf6LUUzKXe9XiP8BdPvjBguGzAKnzkxDteggsqiFgZBvygvg@mail.gmail.com>
References: <20131120073002.EB8E9101271@stock.ovh.net>
 <CAAXf6LUUzKXe9XiP8BdPvjBguGzAKnzkxDteggsqiFgZBvygvg@mail.gmail.com>
Message-ID: <CAAXf6LUidS98H4LKQ50uy0-Qt3YRs89r0yEqppNH6TooJnC0Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 20, 2013 at 9:02 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[..]
>
> Man pages in udisks are only built when 'BR2_HAVE_DOCUMENTATION' is
> set, but this is deprecated.
> Therefore I propose to always build without man pages for udisks. I
> will provide a patch...

Seems Peter already handled this yesterday, I didn't realize that...
