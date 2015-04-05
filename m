From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 23:20:28 +0200
Subject: [Buildroot] [PATCH/RFC 03/27] package/kodi: bump version to
 15.0 Alpha2-Isengard
In-Reply-To: <20150404184448.3fea759b@free-electrons.com>
References: <1427913380-14808-1-git-send-email-bernd.kuhls@t-online.de>
 <1427913380-14808-4-git-send-email-bernd.kuhls@t-online.de>
 <20150404184448.3fea759b@free-electrons.com>
Message-ID: <20150405212028.GI4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-04 18:44 +0200, Thomas Petazzoni spake thusly:
> On Wed,  1 Apr 2015 20:35:56 +0200, Bernd Kuhls wrote:
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/kodi/0001-Fixup-include-path.patch |   20 --------------
> >  package/kodi/0002-texturepacker.patch      |   12 ++++++++
> >  package/kodi/0003-lirc-PR6783.patch        |   41 ++++++++++++++++++++++++++++
> >  package/kodi/Config.in                     |   15 +++++-----
> >  package/kodi/kodi.mk                       |   33 ++++++++++++----------
> >  5 files changed, 78 insertions(+), 43 deletions(-)
> >  create mode 100644 package/kodi/0002-texturepacker.patch
> >  create mode 100644 package/kodi/0003-lirc-PR6783.patch
> 
> Do you know when the final release of Kodi 15.0 is planned? The next
> Buildroot version will be 2015.05, with a feature freeze at the end of
> April. Will Kodi 15.0 final be released by then? It would be a bit
> weird to have a stable Buildroot release with an Alpha version of Kodi
> packaged.

From the cover letter:
    "this series is a RFC and not meant for committing to buildroot."

Bernd is doing quite a good job at providing "snapshots" of his bump of
Kodi (yeah, I don't have to do it! :-) ), so we can review and fix the
issues, so that when the final version is finally cut, integrating in
Buildroot would be quite easy.

I'll try to get some time to review the series (I already spot some
issues in the first few commits).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
