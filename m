From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:01:10 +0100
Subject: [Buildroot] ping and nslookup doesn't work on device
In-Reply-To: <CAJO1S93csWgVZsGX_Qj5HOCgnphzS1R2A_Oaj-RVbmRohkNH7A@mail.gmail.com>
References: <CAJO1S93csWgVZsGX_Qj5HOCgnphzS1R2A_Oaj-RVbmRohkNH7A@mail.gmail.com>
Message-ID: <20141126220110.15e1b74e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kantanu Kumar Mohapatra,

On Wed, 26 Nov 2014 20:01:50 +0530, Kantanu Kumar Mohapatra wrote:

> I am using an ARM 926EJS target board with buildroot-2014.02 to build the
> code.
> I am running linux-2.6.39 kernel.
> 
> Ping and nslookup not working on my device.
> 
> # ping google.com
> ping: *bad address 'google.com <http://google.com/>'*
> 
> # ping 192.168.1.104
> PING 192.168.1.104 (192.168.1.104): 56 data bytes
> 64 bytes from 192.168.1.104: seq=0 ttl=64 time=3.657 ms
> 64 bytes from 192.168.1.104: seq=1 ttl=64 time=0.402 ms
> 64 bytes from 192.168.1.104: seq=2 ttl=64 time=0.366 ms
> --- 192.168.1.104 ping statistics ---
> 3 packets transmitted, 3 packets received, 0% packet loss
> round-trip min/avg/max = 0.366/1.475/3.657 ms
> 
> # nslookup google.com
> nslookup: *can't resolve 'google.com <http://google.com/>*'

Do you have valid things in /etc/resolv.conf ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
