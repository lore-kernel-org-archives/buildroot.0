From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 23:11:29 +0100
Subject: [Buildroot] [PATCH 1/1] thrift: fixes compilation issues
In-Reply-To: <1392843957-2914-1-git-send-email-romain.naour@openwide.fr>
References: <1392843957-2914-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CACXmViYrbGv+c1M=gFNyH9tMsrDMLRnKsRC5QteNU=gkiEnZVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 19, 2014 at 10:05 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Apply upstreamed patches:
> https://issues.apache.org/jira/browse/THRIFT-2229
> https://issues.apache.org/jira/browse/THRIFT-2367
>
> Fixes:
> http://autobuild.buildroot.net/results/efb/efbbae54b5a16b26cac7fcc69ea99bb6f8661fe8/build-end.log
> http://autobuild.buildroot.net/results/f83/f837440fdf8b3bddfc6cc548902a0453640fa6b4/build-end.log
>
> [Romain: patch 05 rebased on top of thrift-0.9.1]
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
