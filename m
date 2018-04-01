From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 12:27:36 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <d437caa3ff89a6c3f29997a008ce74ab2f495940.camel@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Sun, 01 Apr 2018 11:45:20
 +0200")
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
 <d437caa3ff89a6c3f29997a008ce74ab2f495940.camel@embedded.rocks>
Message-ID: <87h8ovrzl3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

Hi,

 >> The first option is probably the easiest/nicest.

 > On second thought, bash might not be the only application using
 > /dev/fd. Maybe fs/common.mk is the better place?

Possible, yes. I'm not aware of any other tools needing it though.

 > There is one issue about /proc/kcore. It is not available on ARM
 > systems, and maybe others. Apparently, this feature is not much
 > appreciated [1], so I'm gonna skip this symlink.

Yes, lets just skip it.

-- 
Bye, Peter Korsgaard
