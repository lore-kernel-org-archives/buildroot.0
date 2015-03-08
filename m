From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 09:03:21 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <CAHkwnC93TA=SbbTwARp7KTqoG1xkUtL8epky9PA8-HnJS7a75w@mail.gmail.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
 <20150307173234.57c8bf4f@free-electrons.com>
 <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
 <20150308081520.1a6e9fc7@free-electrons.com>
 <CAHkwnC9VfqeHc8SGqwJJu777npQ7brMi=B=Ck6rv6CQUyTHB2Q@mail.gmail.com>
 <20150308084636.06f56bb6@free-electrons.com>
 <CAHkwnC93TA=SbbTwARp7KTqoG1xkUtL8epky9PA8-HnJS7a75w@mail.gmail.com>
Message-ID: <20150308090321.6aee966b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 8 Mar 2015 08:54:52 +0100, Fabio Porcedda wrote:

> In the efl project where the evas library was merged, they have
> already added support for giflib 5:
> https://git.enlightenment.org/core/efl.git/commit/?id=096ae0e86fe306d40d744c8c11960dd9e736c4b4
> 
> So maybe we can just back port that commit.

If you bump EFL to the latest version, there's no need to do this,
since the commit is already part of EFL releases.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
