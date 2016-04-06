From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Apr 2016 23:47:03 +0200
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <CAPWb3NQ6nw3r5YOV9pMZnu1X1tUbh9F7TTKXYBC_00KOrQBUjw@mail.gmail.com>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
 <CAPWb3NQ6nw3r5YOV9pMZnu1X1tUbh9F7TTKXYBC_00KOrQBUjw@mail.gmail.com>
Message-ID: <570583D7.8090202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/16 04:55, Justin Berger wrote:
> I didn't check it explicitly against 4.7, but I looked at the supported C++
> features in 4.7 vs 4.8 and it looked like it should work. Currently the only GCC
> options that show up in the menuconfig though are 4.8 and onwards, is the reason
> to prefer 4.7 vs 4.8 for people to backport?

  People may have a custom prebuilt toolchain using gcc 4.7.

  You can use Sourcery CodeBench SH 2012.09 or Sourcery CodeBench x86/x86_64 
2012.09 to test. Build test is probably enough, though the x86 toolchain should 
be easy to run-time test.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
