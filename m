From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 5 Apr 2014 02:46:28 +0400
Subject: [Buildroot] host-binutils broken?
In-Reply-To: <loom.20140404T230545-334@post.gmane.org>
References: <533EED51.9090204@freescale.com>
 <CAMo8BfJhxpqBFmFeADF97cKbANtzNFYy2_L=wrMjLn8zUtinyw@mail.gmail.com>
 <loom.20140404T230545-334@post.gmane.org>
Message-ID: <CAMo8BfKN8NAsfS1aM31TzjUvfJ1EFRQTZVnxH4U2M0BN0XWq1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 5, 2014 at 1:21 AM, Vincent Stehl?
<vincent.stehle@laposte.net> wrote:
> Thanks for looking into this issue. I could reproduce it at home in the
> following way:
>
>   $ git clean -fdx
>   $ git checkout f90760fe0ed7317510bc6f44c5508e2072ed217d
>   $ make raspberrypi_defconfig
>   $ make |& tee log
>
> It "chokes" when making as.info, during install-am.

Doesn't produce even a single warning for me... What's your makeinfo version?

> Here is the log: http://pastebin.com/nsUjcZXf
> And here is the .config: http://pastebin.com/cyuKb9yA

-- 
Thanks.
-- Max
