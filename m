From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 23:30:15 +0200
Subject: [Buildroot] [PATCH WIP 15/16] xbmc: Bump version to Gotham_beta3
In-Reply-To: <jahr0bx4a6.ln2@ID-313208.user.individual.net>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
 <20140331220546.GD5004@free.fr>
 <qi8r0bx5mu.ln2@ID-313208.user.individual.net>
 <20140401183534.GB3291@free.fr>
 <jahr0bx4a6.ln2@ID-313208.user.individual.net>
Message-ID: <20140401213015.GB1278@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-01 21:40 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140401183534.GB3291 at free.fr: 
> 
> > Note also, that many of the XBMC sub-options have dependencies on
> > toolchain features (eg. IPv6, threads, and so on...) which are not
> > currently expressed, being implicit as XBMC depends on (e)glibc, and so
> > those features are guaranteed to be present in this case. But when
> > enabling building with uClibc, those dependencies will have to be added,
> > which is not a trivial change. And your patch is missing all those new
> > required dependencies. Having split-patches will make it easier to check
> > those dependencies.
> 
> Hi,
> 
> ok, you convinced me to split the patch, I already started work ;)
> 
> efc3c8359e6493dbcdf32afd4f9d4075dd4b9f4a WIP: xbmc: needs host-gawk
> bbcfd437efa76bd358a287d0505dc98f2c9987e5 WIP: xbmc: Add option for Goom 
> screensaver
> 3b33e850145ae59e1a51f14933b1d889a7ce8091 WIP: xbmc: Disable broken rsxs 
> screensaver
> ca08b3b00d44a70cd65bedb5737254ff286b1c72 WIP: xbmc: Add lame support
> aaf2d1b40144266446d5764baf65b9ed1a44e7a3 WIP: xbmc: Add alsa support
> 7a4721ab543e705ced87f8e4dbeb38c91af14914 WIP: xbmc: Add VA-API support
> 21c7aa5957c8855a1b0ecbe5f2a8a16b583d4439 WIP: xbmc: Add X.org support
> 283da553c5fe11f64486e825e8d1975403fa633e WIP: xbmc: Allow compilation with 
> uClibc
> 19018489f879c289b41de3013ea98724bb0c550c WIP: xbmc: Bump version to 
> Gotham_beta3

Wonderful! :-)

Just to make sure: the bump to Gotham should be the first change, and
then all other changes are additions to that?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
