From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 01:55:15 +0100
Subject: [Buildroot] [PATCH] gnutls-2.12.20-glibc-2.16.patch glibc-2.16
 and gnutls2 fix i forgot my signoff
In-Reply-To: <CAHXCMMLpVAHmvEHdpkyorLHb=DJGmHhG6cnWkpZ0pkfEp5Sg9g@mail.gmail.com>
References: <1352464266-22684-1-git-send-email-alexander@mezon.ru>
 <CAHXCMMLpVAHmvEHdpkyorLHb=DJGmHhG6cnWkpZ0pkfEp5Sg9g@mail.gmail.com>
Message-ID: <509DA5F3.2000108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 17:54, Samuel Martin wrote:
> Hi Alexander,
>
> 2012/11/9 Alexander Khryukin<alexander@mezon.ru>:
>> >
>> >  Signed-off-by: Alexander Khryukin<alexander@mezon.ru>
>> >  ---
>> >    package/gnutls/gnutls-2.12.20-glibc2.16.patch | 26 ++++++++++++++++++++++++++
>> >    1 file changed, 26 insertions(+)
>> >    create mode 100644 package/gnutls/gnutls-2.12.20-glibc2.16.patch
>> >
>> >  diff --git a/package/gnutls/gnutls-2.12.20-glibc2.16.patch b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
>> >  new file mode 100644
>> >  index 0000000..6b7f545
>> >  --- /dev/null
>> >  +++ b/package/gnutls/gnutls-2.12.20-glibc2.16.patch
>> >  @@ -0,0 +1,26 @@
>> >  +--- gnutls-2.12.20/gl/stdio.in.h
>> >  ++++ gnutls-2.12.20/gl/stdio.in.h
> When adding a patch to a package, we usually add a header to the patch
> containing a description and the SoB line.

  And the commit message itself should also be something more explanatory, e.g.:

gnutls: fix build with glibc2.16, which doesn't declare gets()

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
