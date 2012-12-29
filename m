From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 21:04:51 +0200
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <20121229193947.2e157779@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <50DF04B3.30801@petroprogram.com> <20121229171540.5bb22f40@skate>
 <201212291903.06705.yann.morin.1998@free.fr> <20121229193947.2e157779@skate>
Message-ID: <50DF3ED3.60702@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

29.12.2012 20:39, Thomas Petazzoni kirjoitti:
> Dear Yann E. MORIN,
>
> On Sat, 29 Dec 2012 19:03:06 +0100, Yann E. MORIN wrote:
>
>> I've found using quilt to be troublesome. For example, you absolutely
>> have to tell quilt what files you are *going* to edit, otherwise,
>> quilt will miss your changes. And this situation happens more often
>> than not; in my experience, it happened quite often that I edited a
>> file because I _knew_ where the failure was, to later find I forgot
>> to tell quilt about that file, and was missing that change in the
>> patch series.
>>
>> So, I would recommend against using quilt; rather use the package's
>> upstream repository, or at worse, create a temporary git tree just in
>> the package's extracted directory: it's much more convenient and
>> powerfull than using quilt.
> <troll severity="strong">
>
> That's because you're using a prehistoric, basic, limited and
> feature-less text editor named vim.
>
> Under the modern, wonderful, feature-rich text editor named Emacs,
> there is something called "quilt-mode". Once you're in quilt mode,
> Emacs turns all buffers of a quilt-managed project read-only, unless
> that particular buffer edits a file that has been quilt-added into the
> current patch.
>
> Therefore, with quilt-mode in place, there is zero chance to
> incorrectly edit a file you forgot to quilt add.
>
> That said, even though I'm an heavy Emacs user, I'm not using
> quilt-mode at the moment. I have been hit often enough with this quilt
> "issue" that I no longer forget to do the quilt add. Or in fact, I
> always use "quilt edit", which makes sure the file is "quilt added"
> before starting up my favorite text editor.
>
> </troll>
>
>  :-)
>
> Thomas

Hope this is not escalating into Vim vs. Emacs flamewar :-)

We "real" programmers just use nano as editor and raw diff as our patch
generating tool.
;-)

From Dilbert comic strip/:

//*Old Guy*:/ When I started out we didn't have those sissy windows and
icons. All we had were zeros and ones./*
Wally:*/ We didn't have ones. I once wrote an entire program with just
zeros./*
Dilbert:*/ You had zeros? We had to use the letter "o".

Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121229/82c88164/attachment.html>
