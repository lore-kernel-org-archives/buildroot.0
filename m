From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:34:26 +0100
Subject: [Buildroot] [PATCH 00/14] Bump ejabberd version to 17.04
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180117223426.3992509d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 15:06:35 +0100, Johan Oudinet wrote:
> Ejabberd has many dependencies. Bump all of them to the versions needed
> by ejabberd-17.11.
> 
> Johan Oudinet (14):
>   erlang-lager: Bump to version 3.4.2
>   erlang-p1-utils: Bump to version 1.0.10
>   erlang-p1-zlib: Bump to version 1.0.3
>   erlang-p1-xml: Bump to version 1.1.25
>   erlang-stringprep: Bump to version 1.0.10
>   erlang-p1-xmpp: Bump to version 1.1.16
>   erlang-p1-cache-tab: Bump to version 1.0.12
>   erlang-p1-iconv: Bump to version 1.0.6
>   erlang-p1-oauth2: Bump to version 0.6.2
>   erlang-p1-tls: Bump to version 1.0.17
>   erlang-p1-stun: Bump to version 1.0.16
>   erlang-p1-sip: Bump to version 1.0.17
>   erlang-p1-yaml: Bump to version 1.0.12
>   ejabberd: Bump to version 17.11

I've applied patches 1 to 13, and marked patch 14 as Changes Requested
in patchwork.

There was a minor issue on the erlang-p1-xmpp patch, I'll reply
separately to this one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
