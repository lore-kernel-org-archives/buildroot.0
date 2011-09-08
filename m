From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 8 Sep 2011 06:24:07 -0500
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <4E68A0E4.8080402@lucaceresoli.net>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <1315476029.19139.4.camel@dublxciaranr1.verifone.com>
 <4E68A0E4.8080402@lucaceresoli.net>
Message-ID: <201109080624.10067.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu September 8 2011, Luca Ceresoli wrote:
> Let me add my two cents to this irresistible, brainstorming-like,
> non-violent flamewar. :)
> 
> Quotient Remainder wrote:
> >>> _FILE_INSTALL_TABLE.
> >>
> >> This one seems good to me. Peter ?
> >
> > They're all operations (create or change) on file-system entries so
> > maybe like ..._EXTRA_FS_OPERATIONS or similar?
> 
> inodes_table?
> nodes_table?
> fsnodes_table?
>

The action being accomplished is to "provision" the generated
image.
So a name based on the action might be a better choice.

Just avoid anything that implies "provisional", which can be 
misunderstood to have a similar meaning as "conditional".

Mike 
> Luca
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
