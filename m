From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 12:28:27 +0200
Subject: [Buildroot] [PATCH 00/11] Bump ejabberd version to 15.06
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150711122827.7f7c9d22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed,  8 Jul 2015 11:54:13 +0200, Johan Oudinet wrote:

> Johan Oudinet (11):
>   ejabberd: bump to version 15.06

Applied.

>   ejabberd: simplify init script by patching ejabberdctl

Not applied yet, I'll send some comments as a reply to the patch itself.

>   ejabberd: fix package version
>   erlang-p1-utils: bump to version 1bf99f9
>   erlang-p1-cache-tab: bump to version f7ea12b
>   erlang-p1-tls: bump to version b070004
>   erlang-p1-stringprep: bump to version 3c64023
>   erlang-p1-xml: bump to version 2c61083
>   erlang-p1-stun: bump to version a3dce07
>   erlang-p1-sip: bump to version fd3e461
>   erlang-p1-yaml: bump to version e1f081e

All applied.

Another side question: ejabberd has quite a few patches, can you see if
they can be upstreamed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
