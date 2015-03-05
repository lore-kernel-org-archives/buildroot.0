From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 5 Mar 2015 11:21:30 +0100
Subject: [Buildroot] [PATCH] autoconf-archive: add hash
In-Reply-To: <20150304234446.12901fc2@free-electrons.com>
References: <1424874186-10571-1-git-send-email-bgolaszewski@baylibre.com>
 <20150304234446.12901fc2@free-electrons.com>
Message-ID: <CAMpxmJV70fKLOVFe=wH2sKWDOgTp5B5ycVgu5Nzwrzp+1fzjLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-04 23:44 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Bartosz Golaszewski,
>
> On Wed, 25 Feb 2015 15:23:06 +0100, Bartosz Golaszewski wrote:
>
>> diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
>> new file mode 100644
>> index 0000000..9abb905
>> --- /dev/null
>> +++ b/package/autoconf-archive/autoconf-archive.hash
>> @@ -0,0 +1 @@
>> +sha512 54382adcf55b9dd126de6727c034cae7c72c8217c9979d3b889705c3bfe41ec8329621dea5ff592ebf7e530775ce96faf47baffe36e8fedf9cd78c8dc423932e autoconf-archive-2015.02.04.tar.xz
>
> There should be a comment above that says where the hash was found:
> from which URL, or computed locally.
>
> And if it's computed locally, our current rule is to use sha256, not
> sha512.
>
> Can you fix and resend? Thanks!

Sure thing!

Bart
