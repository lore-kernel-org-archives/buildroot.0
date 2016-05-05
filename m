From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 5 May 2016 09:54:07 +0200
Subject: [Buildroot] Which package for bluetooth management?
In-Reply-To: <572AEB2E.1050305@gmail.com>
References: <572A61D4.10905@gmail.com>
 <7132491b-5080-2001-1717-250d698244e9@mind.be> <572AEB2E.1050305@gmail.com>
Message-ID: <572AFC1F.3070004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 05/05/2016 08:41, Marco Trapanese ha scritto:
>
> I apologize. I need to use bluez4 due to the issues of bluez5 with 
> pulseaudio about HFP profiles.

Anyway I'm rebuilding with bluez5 to see if I can reach my goals. Because:

- bluez4 is recommended with pulseaudio due to simpler configuration of 
A2DP and HFP
- but connman 1.32 doesn't support bluez4 anymore
- but QtConnectivity doesn't support bluez5

It's a bit frustrating :)
So I selected:

- bluez5
- pulseaudio
- connman

Let's see if I can manage A2DP/HFP/BLE services at the same time.
