From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:33:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/subversion: security version
 bump to 1.9.3
In-Reply-To: <1454264630-10916-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454264630-10916-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131203344.44500673@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 19:23:50 +0100, Bernd Kuhls wrote:
> Release announcement:
> http://mail-archives.apache.org/mod_mbox/subversion-dev/201512.mbox/%3CCAP_GPNj_GCA869VQeJUrp5ngXsgN7pQQHSS=sqoXm8_6hHTTxg at mail.gmail.com%3E
> 
> CVE-2015-5259:
> Remotely triggerable heap overflow and out-of-bounds read caused by
> integer overflow in the svn:// protocol parser.
> http://subversion.apache.org/security/CVE-2015-5259-advisory.txt
> 
> CVE-2015-5343:
> Remotely triggerable heap overflow and out-of-bounds read in mod_dav_svn
> caused by integer overflow when parsing skel-encoded request bodies.
> http://subversion.apache.org/security/CVE-2015-5343-advisory.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/subversion/subversion.hash | 2 +-
>  package/subversion/subversion.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
