From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 08 Jul 2014 08:41:31 -0300
Subject: [Buildroot] mpd build error
In-Reply-To: <65C3B8A7B8C54F1AB53C66387CFA90E3@JohanW7>
References: <65C3B8A7B8C54F1AB53C66387CFA90E3@JohanW7>
Message-ID: <53BBD8EB.3050300@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/08/2014 07:07 AM, Sagaert Johan wrote:

> Strange I tried one of the qemu_arm builds with mpd and that one was ok.

Hi.
Blame gcc 4.9.x :)
Actually it's more likely a mpd source issue, i'll look into it, but
going to the default 4.8.x will fix it for you.
Regards.
