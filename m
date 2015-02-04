From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 04 Feb 2015 16:57:01 +0100
Subject: [Buildroot] Fwd: Problem with rcK script
In-Reply-To: <CAJpGAeHWB=+AU9-ZCSpczqsy_06H2x8mp-b7=dvHSsiHZQU7sQ@mail.gmail.com>
References: <CAJpGAeFjiFn9rw3uj9j1xbA4JqWr4PJ89X9A_7=VKjKYK6Yu8Q@mail.gmail.com>
 <CAJpGAeHWB=+AU9-ZCSpczqsy_06H2x8mp-b7=dvHSsiHZQU7sQ@mail.gmail.com>
Message-ID: <01A97699-6B5B-436F-907D-F9A1C8F05285@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On February 4, 2015 9:33:10 AM CET, hardik gohil <hardikmjobs@gmail.com> wrote:
>Hello,
>
>I am working on Embedded Board and using buildroot-2013.02 and
>linux-2.6.35.9
>
>problem i am facing is with rcK script which runs once system is
>rebooted
>as mentioned in /etc/inittab.
>
>As mentioned in rcK script to stop all the init scripts in /etc/init.d
>in
>reverse order i cannot see any such messages.

The problem you describe has been fixed in later releases, with commit 
http://git.buildroot.net/buildroot/commit/system/skeleton/etc/inittab?id=1dbb7e8a822416d502095ecb2c463a5179074555 .

I suggest you either upgrade buildroot or apply this patch in your tree.

Best regards,
Thomas
