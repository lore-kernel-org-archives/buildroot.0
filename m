From: Erik Andersen <andersen@codepoet.org>
Date: Thu Jul 27 11:38:44 2006
Subject: [Buildroot] base busybox version for buildroot?
In-Reply-To: <bf61e79a0607270644g7beea2b2p67890c1a88528436@mail.gmail.com>
References: <bf61e79a0607270644g7beea2b2p67890c1a88528436@mail.gmail.com>
Message-ID: <20060727183737.GB23639@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu Jul 27, 2006 at 09:44:42AM -0400, Drew Cohan wrote:
> Hi,
> 
> Is the base busybox version for buildroot is now 1.2.0, instead of
> 1.1.3?  Is there a buildroot config somewhere that determines which
> version of busybox is used, or is it just based on the date of the
> buildroot package (builds after 30 June 2006 use busybox 1.2.0)?
> There seems to have been a file size change recently, just curious
> what that might have been:
> 
> buildroot-20060710.t..> 10-Jul-2006 00:17  3.8M
> buildroot-20060711.t..> 11-Jul-2006 00:17  4.3M

It probably makes sense at this point to have configurable
busybox versions (as with gcc and binuitls) with a specific
default config for each.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
