From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 30 Jan 2013 23:37:41 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <201301302023.59219.yann.morin.1998@free.fr>
References: <201301302023.59219.yann.morin.1998@free.fr>
Message-ID: <1359585462-1314-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 30 January 2013 20:23:58 Yann E. MORIN wrote:
[...]
> In case one uses a custom directory to store all downloaded files (eg. I
> use "${HOME}/src" so I don't have to download them again and again), this
> directory gets cluttered with many files that are difficult to link to
> the package they apply to.
> 
> It gets even worse with this change.
> 
> What about saving the patches to a file named thus:
>    $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patches
Sure!

Patch follows, Looks doing the job. Nevertheless, I begin to found this feature a 
little difficult to read (euphemism...). Someone has an opinion about coding 
style?


-- 
J?r?me Pouiller
