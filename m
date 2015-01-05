From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 10:32:21 +0100
Subject: [Buildroot] [PATCH 1/1] python-django: new package
In-Reply-To: <CAAwwcmTD55=ZS7z_iTVmZz-cSmGw27wntqtcy4Bmm0+WJ_L6HA@mail.gmail.com>
References: <1420244904-23270-1-git-send-email-oli.vogt.pub01@gmail.com>
 <20150104220810.131bd08d@free-electrons.com>
 <CAAwwcmTD55=ZS7z_iTVmZz-cSmGw27wntqtcy4Bmm0+WJ_L6HA@mail.gmail.com>
Message-ID: <20150105103221.75f14d95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oli Vogt,

On Mon, 5 Jan 2015 11:37:34 +1300, Oli Vogt wrote:

>  Yes it should work with Python3 however I was not able to test it as I use
> 2.7. This meant I was not sure about core module dependencies. Thanks.

Ok. I assumed the same core Python 3 dependencies as with Python 2. I
was able to "import django" in Python 3.

However, I noticed that the django-admin tool does not work on the
target, but maybe this is expected.

>  Sorry about the download link I 'hand-downloaded' the tarball to get
> things started and did not delete it to test. Thanks again.

No problem, this was quickly fixed. Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
