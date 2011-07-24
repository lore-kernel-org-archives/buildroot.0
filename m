From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 24 Jul 2011 13:48:18 +0200
Subject: [Buildroot] [PATCH] Add support for packages stored in
 Mercurial (hg) repositories
In-Reply-To: <CAEYzJUEPRoH0HPYnd4dqxa4ExbbM1JzwtsJBMwT+KEB2U+FwQQ@mail.gmail.com>
References: <dcd0159a2716561b8ff1.1311174968@localhost6.localdomain6>
 <CAEYzJUEPRoH0HPYnd4dqxa4ExbbM1JzwtsJBMwT+KEB2U+FwQQ@mail.gmail.com>
Message-ID: <CAAXf6LWwWASmBcUQd2D9uBj8u9dtk-4ez0ML4Enuzsr=YwgkEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2011/7/20 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> On 20 July 2011 17:16, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> ?Config.in ? ? ? ? ? ? ? ? ? | ? 4 ++++
>> ?package/Makefile.package.in | ?31 ++++++++++++++++++++++++++++---
>> ?2 files changed, 32 insertions(+), 3 deletions(-)
>
> Could you also update the documentation? Look for LIBFOO_SITE_METHOD
> in docs/buildroot.html.

Will do. I'll try and send out an updated patch tomorrow...

Thanks for reminding me,
Thomas
