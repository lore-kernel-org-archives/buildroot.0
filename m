From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 27 Aug 2015 19:52:06 +0200
Subject: [Buildroot] Buildroot article in Mind newsletter
In-Reply-To: <55DF2D35.2050302@mind.be>
References: <55DF2D35.2050302@mind.be>
Message-ID: <4B6D9344-AE3C-49D2-B8FD-DA3F8163C652@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On August 27, 2015 5:31:01 PM CEST, Arnout Vandecappelle <arnout@mind.be> wrote:
> Hi all,
>
>I wrote a short article for my company's newsletter (which we try to
>fill with
>interesting stuff rather than commercial blabla) about recent (= last 5
>years)
>developments in Buildroot. If anyone is interested, you can read it on
>our
>website [1]. It's CC-BY-SA licensed so you can reuse the text. You can
>download
>the source here[2].
>
>Note: the newsletter will only be sent out tomorrow, so if you think
>I'm
>writing something that's incorrect or not very good and it should be
>changed,
>there's still a bit of time...

Nice write-up, thanks.
One small note: when describing the external toolchain feature, you mention 
'Sourcery, Linaro or a vendor supplied toolchain', but none of these cover the 
case of a custom toolchain built differently, for example using crosstool-ng, full manual build, ... 
I would therefore either add an ellipsis, or 
specify 'or another custom toolchain' or alike.

/Thomas
