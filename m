From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sat, 22 Apr 2017 23:22:47 +0200
Subject: [Buildroot] [PATCH] package/kodi: fix path to binary
In-Reply-To: <20170422210539.5750-1-yann.morin.1998@free.fr>
References: <20170422210539.5750-1-yann.morin.1998@free.fr>
Message-ID: <8687097e-0f0c-135c-df57-454ff0e60682@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann,

On 22.04.2017 23:05, Yann E. MORIN wrote:
> Since XBMC was renamed to Kodi, upstream is progressively propagating
> the rename to directories and files, and in some cases kept a legacy
> symlink xbmc->kodi, like /usr/lib/xbmc pointing to /usr/lib/kodi.
> 
> In 62165ae (package/kodi: Fix path to binary in service), the path nary
> was changed to use the new canonical path, but the init script was eft

Another typo here 'eft'.

> out. This was not seen previously, becasue of the legacy symlink.
> 
> But with the adevent of Kodi 17 (Krypton), that legacy symlink is no

And here 'adevent'.

> [...]


Best wishes,
Marcus
