From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 09:37:07 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <20121130001154.129b9238@skate>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211300652.45293.manningc2@actrix.gen.nz> <20121129190813.5dc97298@skate>
 <201211300731.53056.manningc2@actrix.gen.nz> <50B7C54C.3010103@mind.be>
 <20121130001154.129b9238@skate>
Message-ID: <50B87033.7090609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 00:11, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Thu, 29 Nov 2012 21:27:56 +0100, Arnout Vandecappelle wrote:
>
>>    We could obviously solve this by unexporting PKG_CONFIG_SYSROOT_DIR, but
>> perhaps the better approach is to remove those environment variables from our
>> custom pkgconf?
>
> No, we use PKG_CONFIG_SYSROOT_DIR="/" when we build packages for the
> host, so we can't simply remove support for the PKG_CONFIG_SYSROOT_DIR
> environment variable. Unexporting PKG_CONFIG_SYSROOT_DIR sounds like
> the good solution here.

  Right.

  Charles, would you care to prepare a patch that unexports PKG_CONFIG_SYSROOT_DIR
and test it in your angstrom environment?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
