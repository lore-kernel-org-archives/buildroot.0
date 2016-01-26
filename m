From: Chris LaRocque <clarocq@gmail.com>
Date: Tue, 26 Jan 2016 07:27:55 -0500
Subject: [Buildroot] ssh: connect to host pi adress port 22: Connection
	refused
In-Reply-To: <CABi8WTwSOgwoBqrn4ZAgm3YU1U7a-JH1-vxNSxVXGoY91hksxw@mail.gmail.com>
References: <CABi8WTyCkO0dbH0GKkwV+C4Hb_OtaPipk06zBuNCuDJoHK7bLA@mail.gmail.com>
 <20160125093723.32061baa@free-electrons.com>
 <20160125231734.12073cda@gmx.net>
 <CABi8WTwSOgwoBqrn4ZAgm3YU1U7a-JH1-vxNSxVXGoY91hksxw@mail.gmail.com>
Message-ID: <CAOURK2tso-b0ZKwthinF2kZwDqTXxfKbiuGX+HobhchhSZ1yvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah, yes. You should review the buildroot documentation on the topic of
adding users.

Glad you sorted it out.

Regards

Chris

Pushing back the boundaries of ignorance.
On Jan 25, 2016 7:56 PM, "FrAnKenStEiN MC" <chfakht@gmail.com> wrote:

> Hi all, the problem is that i have used *ssh pi at 10.42.0.5 <pi@10.42.0.5> *to
> connect (this is because i defined the hostname to be "pi" but it seems
> after login with root that the username pi doesn't exist by running
> cut -d: -f1 /etc/passwd)
> i'm now connected by *ssh root at 10.42.0.5 <root@10.42.0.5>  *
> i want to know why i can't login with the pi (or maybe the hostname means
> something else ) ?
> and by using HDMI i could see in the last line *pi login : *appears ...
> thanks
>
> ?
>
> 2016-01-25 22:17 GMT+00:00 Peter Seiderer <ps.report@gmx.net>:
>
>> Hello FrAnKenStEiN MC,
>>
>> On Mon, 25 Jan 2016 09:37:23 +0100, Thomas Petazzoni <
>> thomas.petazzoni at free-electrons.com> wrote:
>>
>> > Hello,
>> >
>> > On Mon, 25 Jan 2016 02:37:18 +0000, FrAnKenStEiN MC wrote:
>> >
>> > > But whe trying ssh i get `connection refused`
>> > >
>> > >     ssh pi at 10.42.0.5
>> > >     ssh: connect to host 10.42.0.5 port 22: Connection refused
>> > >
>> > > I couldn't solve this problem all the day !!!
>> >
>> > Plug a serial port adapter on your RPi, and look at the boot messages,
>> > and see if dropbear gets started, and if it does, see if there are any
>> > error message.
>>
>> With buildroot from git (as of today) it worked for me (both cases ro and
>> rw
>> root filesystem)...., any chance to plugin a hdmi monitor (besides from a
>> serial console) to get access to the last lines of boot messages?
>> Mind to share your buildroot config file? How did you configure your ip
>> adress, via cmdline.txt?
>>
>> Regards,
>> Peter
>>
>> >
>> > Best regards,
>> >
>> > Thomas
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160126/ae93e1bb/attachment.html>
