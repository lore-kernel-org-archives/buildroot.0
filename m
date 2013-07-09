From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 09 Jul 2013 07:23:03 +0200
Subject: [Buildroot]
 =?utf-8?q?Error_while_installing_dosfstools=3A_mkdosf?=
 =?utf-8?q?s=E2=80=99=3A_No_such_file_or_directory?=
In-Reply-To: <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
 (Daniel.'s message of "Tue, 9 Jul 2013 01:26:52 +0000")
References: <CAF3SDA4DY8DkDTVr5F4aLxmoJha60Y4DnZ9yC0u7PdhteR3Svg@mail.gmail.com>
 <87obaciyn8.fsf@dell.be.48ers.dk>
 <CAF3SDA7tGGeJfP2kJcf9Hy6Z4KrqUhHV0E1JBTE+0x+-bCMEMw@mail.gmail.com>
Message-ID: <87bo6ci9xk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel  <danielhilst@gmail.com> writes:

Hi,

Please keep discussion on the buildroot mailing list instead of mailing
me directly.

 Daniel> Here is the config https://gist.github.com/gkos/5950964.

I asked you to run 'make savedefconfig' and post the defconfig file, but
OK.

Are you sure this is the right configuration? I see

# BR2_PACKAGE_DOSFSTOOLS is not set

E.G. you haven't enabled the dosfstools package at all.


 Daniel> I'm using
 Daniel> arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu tool
 Daniel> chain from CodeSourcery

-- 
Bye, Peter Korsgaard
