From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 15 Nov 2013 08:27:37 -0300
Subject: [Buildroot] skeleton   hosts file content for ipv6 ?
In-Reply-To: <79606BB255D84F1DA71D659AD8F8AE6A@JohanW7>
References: <79606BB255D84F1DA71D659AD8F8AE6A@JohanW7>
Message-ID: <52860529.6060207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/15/2013 08:16 AM, Sagaert Johan wrote:

> Hi All;
>  
> When enabling ipv6 , what should be in the /etc/hosts file ?
>  
> For ipv4 it is mostly just 127.0.0.1 localhost
> What should be added when ipv6 has been enabled ?

For the basic barebones the same counterpart
::1 localhost

Regards.
