From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 21:19:30 +0100
Subject: [Buildroot] [PATCH] support/script/scancpan: remove duplicated
 dependency
In-Reply-To: <CAB0FRsvqEKVDX59Sdcz2wQQ+NKqL44LNsW4nKxP0ah_Ua5wtsQ@mail.gmail.com>
References: <1418153523-10972-1-git-send-email-francois.perrad@gadz.org>
 <20141209203539.3d07e284@free-electrons.com>
 <CAB0FRsvqEKVDX59Sdcz2wQQ+NKqL44LNsW4nKxP0ah_Ua5wtsQ@mail.gmail.com>
Message-ID: <20141209211930.328b1c92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Tue, 9 Dec 2014 20:56:26 +0100, Fran?ois Perrad wrote:

> An example with a CPAN module which is not in BR
> 
>    $ support/scripts/scancpan -f HTTP-Daemon
> 
> Without the patch, its dependency on HTTP-Message is duplicated.

Thanks for the example. I've amended the commit log with this and
applied your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
