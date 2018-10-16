From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 16 Oct 2018 23:56:56 +0200
Subject: [Buildroot] Problem with Raspberry Pi 3B+and BT
In-Reply-To: <CALtfCQaiCCCetMG8sHvTjnAZdfnBNUQvZSB0ynn3LT58NH9Omg@mail.gmail.com>
References: <CALtfCQa87Q5w-mOL4sKbW8M7wh4qAH3rBRm6A6H41SEaci=3QQ@mail.gmail.com>
 <CANQCQpbD_fdXrqYGdW74d4EVyCm4eAs6pxiyasg8wTumYZ+XWA@mail.gmail.com>
 <20181012234133.539d0a0b@gmx.net>
 <CALtfCQYKA=MrVGPYY8a7koPLu5SczJ1GxNDOhnfXWsixBEQ_AQ@mail.gmail.com>
 <CALtfCQaiCCCetMG8sHvTjnAZdfnBNUQvZSB0ynn3LT58NH9Omg@mail.gmail.com>
Message-ID: <20181016235656.584581d2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Tue, 16 Oct 2018 08:45:36 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi Peter,
> 
> I've tried the BT with the new rpi-bt-firmware [8c1e2bff1d],
> rpi-wifi-firmware [8c1e2bff1d] and linux-firmware [44d4fca992] and new
> linux [6d27aa156c] packages, but it fails with the same error:
> 
> [30090.903743] Bluetooth: hci0: Frame reassembly failed (-84)
> [30092.980340] Bluetooth: Failed to disable LE scan: status 0x1f
> [30092.980346] Bluetooth: hci0 command 0x200c tx timeout
> 
> After around 8 hours the BT didn't work again.
> 
> Does anyone any suggestion?

Do the check with an original Raspbian Image, if the same error occurs
complain upstream about it, otherwise find out what makes the difference...

Try the search the web, your are not the only one with this problem [1], [2]...

Regards,
Peter

[1] https://github.com/raspberrypi/linux/issues/2264
[2] https://raspberrypi.stackexchange.com/questions/70217/tons-of-bluetooth-hci0-frame-reassembly-failed-84-messages

> 
> Best regards.
> 
> Oscar Gomez Fuente
> TST Sistemas
> www.tst-sistemas.es
