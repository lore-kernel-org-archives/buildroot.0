From: Kantanu Kumar Mohapatra <kantanukumar@gmail.com>
Date: Wed, 26 Nov 2014 20:01:50 +0530
Subject: [Buildroot] ping and nslookup doesn't work on device
Message-ID: <CAJO1S93csWgVZsGX_Qj5HOCgnphzS1R2A_Oaj-RVbmRohkNH7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I am using an ARM 926EJS target board with buildroot-2014.02 to build the
code.
I am running linux-2.6.39 kernel.

Ping and nslookup not working on my device.

# ping google.com
ping: *bad address 'google.com <http://google.com/>'*

# ping 192.168.1.104
PING 192.168.1.104 (192.168.1.104): 56 data bytes
64 bytes from 192.168.1.104: seq=0 ttl=64 time=3.657 ms
64 bytes from 192.168.1.104: seq=1 ttl=64 time=0.402 ms
64 bytes from 192.168.1.104: seq=2 ttl=64 time=0.366 ms
--- 192.168.1.104 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.366/1.475/3.657 ms

# nslookup google.com
nslookup: *can't resolve 'google.com <http://google.com/>*'

Can anyone please say, what should I add in busybox-config (packages),
linux-config and busybox-config to solve this issue.

Thanks,
Kantanu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141126/b817be28/attachment.html>
