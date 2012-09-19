From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 20 Sep 2012 00:02:17 +0200
Subject: [Buildroot] [PATCH v2 1/2] Download packages from github in
 tar.gz format instead git format.
In-Reply-To: <CAHXCMM+r-m6dGDBeOoV6=5vdYt846Y16h2-Mnu3Z8TZbDj1YjQ@mail.gmail.com>
References: <1347746247-12033-1-git-send-email-marek.belisko@open-nandra.com>
 <CAHXCMM+r-m6dGDBeOoV6=5vdYt846Y16h2-Mnu3Z8TZbDj1YjQ@mail.gmail.com>
Message-ID: <CAAfyv34ga52pX_YJXdg_b3WZQKh+gD6B3Av6ERk3=Z6NhJyyrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 16, 2012 at 1:05 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> 2012/9/15 Marek Belisko <marek.belisko@open-nandra.com>:
>> Verified way how to get packages from github by version or sha1
>> (it's enough to use first 7 characters from SHA1):
>> 1. by sha1
>> FOO_VERSION = 1234567
>> FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
>> FOO_SITE = http://github.com/user/package/tarball/master
>>
>> 2. by version
>> FOO_VERSION = v1.0
>> FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
>> FOO_SITE = http://github.com/user/package/tarball/$(FOO_VERSION)
It seems FOO_SOURCE is redundant in both cases. I'll resend updated patch.
It's enough to have SITE + VERSION.
>>
>> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>
> Tested-by: Samuel Martin <s.martin49@gmail.com>

Regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
