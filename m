From: Ozgun <ozgun.gunay@gmail.com>
Date: Mon, 13 Aug 2012 18:16:04 +0300
Subject: [Buildroot] buildroot Digest, Vol 69, Issue 3
In-Reply-To: <mailman.69642.1330589368.2942.buildroot@busybox.net>
References: <mailman.69642.1330589368.2942.buildroot@busybox.net>
Message-ID: <CAPeX=+tj9qAj45rtFThuw+yReS31uXCTaAsf0C6MLNRkOdSxxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have to use a gamepad with br linux. The gamepad is recognized by linux
as a HID device and I can read hid commands form ?/dev/input/event6? with
the evtest ( http://www.freedesktop.org/wiki/Evtest  ).
Even if the interval of device is 1ms, I can read very few values form
?/dev/input/event6?. see below. (The gamepad produces signals with 1ms
interval on windows.)
Do I have to configure libhid or chose another method?



got motion event at: 1343817626.146290 - Type: 3  Code: 0 Value: 574

got motion event at: 1343817626.146360 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.155289 - Type: 3  Code: 0 Value: 606

got motion event at: 1343817626.155359 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.164279 - Type: 3  Code: 0 Value: 638

got motion event at: 1343817626.164349 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.173291 - Type: 3  Code: 0 Value: 670

got motion event at: 1343817626.173361 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.182248 - Type: 3  Code: 0 Value: 702

got motion event at: 1343817626.182315 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.191242 - Type: 3  Code: 0 Value: 733

got motion event at: 1343817626.191309 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.202252 - Type: 3  Code: 0 Value: 765

got motion event at: 1343817626.202321 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.215249 - Type: 3  Code: 0 Value: 796

got motion event at: 1343817626.215317 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.423287 - Type: 3  Code: 0 Value: 762

got motion event at: 1343817626.423358 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.425287 - Type: 3  Code: 0 Value: 728

got motion event at: 1343817626.425357 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.427287 - Type: 3  Code: 0 Value: 694

got motion event at: 1343817626.427357 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.429260 - Type: 3  Code: 0 Value: 659

got motion event at: 1343817626.429331 - Type: 0  Code: 0 Value: 0

got motion event at: 1343817626.431261 - Type: 3  Code: 0 Value: 626

got motion event at: 1343817626.431366 - Type: 0  Code: 0 Value: 0
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120813/c221c52d/attachment-0001.html>
