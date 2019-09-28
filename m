From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 28 Sep 2019 09:27:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: add option to enable
 server support
In-Reply-To: <20190927230212.2ed06bd6@windsurf>
References: <20190925121726.17454-1-heiko.thiery@gmail.com>
 <20190927230212.2ed06bd6@windsurf>
Message-ID: <CAEyMn7YtiqH6=Z5yJeKdtNUjDjRYapQq-NBW-HLm1Q+Y5MMqcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

We don't indent such lines in our coding style, as can be seen in the
> rest of the file. I have fixed this and applied your patch to Buildroot
> master branch.
>
Ok .. thank you.


> Just curious, what is the use case for the server support in libssh ?
> The INSTALL file is not very clear about what WITH_SERVER=ON provides.
>
I need this option for a netconf server implementation (netopeer2). I will
prepare a patchset to bring also these packages.

--
Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190928/d6694a28/attachment.html>
