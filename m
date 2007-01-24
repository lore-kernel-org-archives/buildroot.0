From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 23 Jan 2007 17:11:04 -0700
Subject: [Buildroot] [PATCH] Add local directory for non-public packages
In-Reply-To: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
References: <1169593120.5361.17.camel@elrond.sweden.atmel.com>
Message-ID: <20070124001104.GB17761@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Jan 23, 2007 at 11:58:40PM +0100, Ulf Samuelsson wrote:
> This adds a "buildroot/local" directory.
> The structure of "local" is the same as that of "packages"
> but the contents of "local" is never
> intended to be merged upstream.
> 
> It allows simple maintenance of those application
> since you only need to move the local directory from
> one version of buildroot to a newer.
> 
> Best Regards
> Ulf Samuelsson

See package/customize/ which tries to do the same thing.

If you think perhaps package/customize/ should be renamed
or better documented I'm open to that.  Adding a second
directory doing the same thing however seems unwise.


 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
