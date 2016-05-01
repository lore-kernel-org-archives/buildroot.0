From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 1 May 2016 19:21:54 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump to Python 3.5 and pyc
	compilation improvements
In-Reply-To: <20160501191117.40a7456b@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMLdTCD5CgsNwaCZRXWa4EXcuHpm18JjuWyLh_TBVx1k4Q@mail.gmail.com>
 <20160501152642.3f888793@free-electrons.com>
 <CAHXCMMJ+01WoVug=55dYer2175Wsvdvfo4GTBfTQhi6j-2Ge+w@mail.gmail.com>
 <CAGm1_kt8nCDByM4Hhbc+GGzTF_EiKdKtOHBjtKnyGRwtzTLs=Q@mail.gmail.com>
 <20160501191117.40a7456b@free-electrons.com>
Message-ID: <CAGm1_ksm6GehBroL6ExvON2+BjWEj2XiFH+AD6p2p3fQ6tCsvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 1, 2016 at 7:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 1 May 2016 16:14:58 +0200, Yegor Yefremov wrote:
>
>> >> What do you suggest to handle this one? It seems to be an intentional
>> >> failure.
>> > Yes it is intentional. Removing this file (that contains nothing but a
>> > syntax error...) in post-install hook is ok.
>>
>> Here we just need a dependnecy on PY files only as there is also a
>> run-time issue, that upstream authors didn't want to patch (Thomas and
>> me opened an issue on crossbar's GitHub).
>
> Can you refresh me on that one, I don't remember.

https://github.com/crossbario/crossbar/pull/638
