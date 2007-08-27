From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 23:46:06 +0100
Subject: [Buildroot] [PATCH] Fix pppd make clean and small cleanup
In-Reply-To: <20070827210143.GV11697@aon.at>
References: <d6cda7730708261631y44e4c353p15a94212bee372da@mail.gmail.com>
	<20070827210143.GV11697@aon.at>
Message-ID: <d6cda7730708271546l3bd0568ame4382b2a93934f3c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernard,

   Yes, it does install some files other files besides those being
removed. I've updated it to remove them as well.

Regards,
    Thiago A. Correa

On 8/27/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Mon, Aug 27, 2007 at 12:31:28AM +0100, Thiago A. Corr?a wrote:
> >Hi,
> >
> >   As subject sayd, this fixes make clean on pppd package (there is no
> >rule uninstall in pppd's makefile) and does some small bits of clean
> >up.
>
> I don't remember off-hand, are the listed files all that was installed
> by pppd? Please verify/double-check and let me know.
>
> Thanks for the cleanup anyway!
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pppd.patch
Type: text/x-patch
Size: 1087 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070827/3f343ae0/attachment-0001.bin 
