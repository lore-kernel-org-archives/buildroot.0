From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 23:28:29 +0200
Subject: [Buildroot] [PATCH/next] package/kodi: bump version to 17.3
References: <20170525084239.24966-1-bernd.kuhls@t-online.de>
Message-ID: <tsujvdx9ae.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 25 May 2017 10:42:39 +0200 schrieb Bernd Kuhls:

> Signed-off-by: Bernd Kuhls
> <bernd.kuhls@t-online.de>
> ---
>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
>  package/kodi/kodi.hash                                   | 2 +-
>  package/kodi/kodi.mk                                     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Hi,

it just came to my attention that this version bump fixes a security 
problem so I re-sent a new patch for the master branch:
http://patchwork.ozlabs.org/patch/767151/

Regards, Bernd
