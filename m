From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 25 Jan 2013 08:31:56 +0100
Subject: [Buildroot] Mono Project
In-Reply-To: <af7d339a8b6d435fc1cdc8c07f4dca9f-EhVcX19AQQBeR1svUFVGClxYaABWV0NeXy5NBUFdUF5aVlAWXFYZAFZQVF9WSUcDVg==-webmailer2@server05.webmailer.hosteurope.de>
References: <af7d339a8b6d435fc1cdc8c07f4dca9f-EhVcX19AQQBeR1svUFVGClxYaABWV0NeXy5NBUFdUF5aVlAWXFYZAFZQVF9WSUcDVg==-webmailer2@server05.webmailer.hosteurope.de>
Message-ID: <510234EC.6060502@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25.01.2013 08:16, Rainer Berns at beka-elektronik.de wrote:
> Hi
> 
> has anyone done some work/ tests with Mono and Buildroot in the past or is
> currently working on it ?
> I want to do some tests with a Beaglebone board.
> 
> (I have already send this request but i was stored the boost thread)

I remember trying to integrate mono, but they seem to perform some run-time tests with already compiled binaries. This behavior has to be changed otherwise you cannot cross-compile it. 

Haven't looked at this for ages, perhaps something has changed since then.

Best regards,
Yegor

 
