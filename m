From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:26:34 +0100
Subject: [Buildroot] [PATCH v6 00/16] ejabberd: XMPP server
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203102634.304a7854@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:04 +0100, Johan Oudinet wrote:

> Since ejabberd build system relies on rebar to download its
> dependencies, we've packaged all of them separately and modified
> ejabberd makefile to not download any dependency.
> 
> Actually, every erlang package that is introduced here rely on the
> rebar software. Thus, we also introduce a new infrastructure to
> simplify the development of such packages in buildroot.

I've applied the entire series, thanks for working on this! I'll reply
individually to some of the patches, to indicate the changes I've made,
and also ask some questions that may lead to follow-up patches if
needed.

Thanks a lot for your perseverance in working on those patches!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
