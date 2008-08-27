From: John Voltz <john.voltz@gmail.com>
Date: Tue, 26 Aug 2008 20:06:14 -0400
Subject: [Buildroot] ### Executing FIles
In-Reply-To: <00b101c907cd$12fa1840$1a01a8c0@flexeon32>
References: <20080826223720.B77253C6C1@busybox.net>
	<00b101c907cd$12fa1840$1a01a8c0@flexeon32>
Message-ID: <46a136670808261706v1335cea6g60889e0262ac00bf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 26, 2008 at 6:42 PM, Steve Spano <steve@fl-eng.com> wrote:

> Hello
>
> I am stumped on this issue
>
> I have a buildroot filesystem running and I cannot seem to execute new
> files
> that I have placed on it.
>
> For example, I upload a new executable file that I compile on a host PC.
> I change its permissions to execute and I type "./myfile"
> It comes back saying "-sh: myfile not found"
> BUT, I can vi the file, I can copy it, delete it /etc/etc
> If I change its permissions to read-only and then try to execute it, the
> shell tells me "permission denied".
>
> What could be occurring here?
>
> Steve Spano, President
> Finger Lakes Engineering
>

Sounds like something is wrong with your busybox, or maybe you are
accidentally using regular old bash which I seem to remember causes some
problems for people. It might be helpful if you tell us what architecture
you built it for too.

Regards,

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080826/10a53a43/attachment.htm 
