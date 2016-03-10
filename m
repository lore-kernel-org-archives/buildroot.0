From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 09:31:15 +0100
Subject: [Buildroot] [PATCH 0/8] core: allow for custom, local help;
 rearrange package-specific help (branch yem/help)
In-Reply-To: <56E0B327.70807@mind.be>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <56E0B327.70807@mind.be>
Message-ID: <20160310093115.6ff24ea6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Mar 2016 00:35:03 +0100, Arnout Vandecappelle wrote:

> > After the first patch implements this (which is really all that is
> > needed to print custom help), we go further with providing a macro that
> > pretty-prints the help for rules, so that the layout is all handled in a
> > single location. This macro can also be used by the local help, too.
> 
>   This bit I really like!

Doesn't Yann proposal fails short if you want to pretty print something
like this:

	foobar - This is a really really long help message that spans
	         multiple lines, and would definitely be too long on
	         one single line.

IOW, I believe we should leave more freedom to what is appended to the
help text, and simply leave it to the person writing the help text to
format it properly.

In my opinion, the very simple proposal from J?r?me has turned into a
much more complicated solution, with no real benefit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
